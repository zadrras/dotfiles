from __future__ import unicode_literals, print_function, absolute_import
from gi.repository import Gio
import os.path

VALID = {'toplevel': ('expand', 'size', 'orientation'),
         'launcher': ('object-type', 'launcher-location', 'locked', 'menu-path', 'position', 'toplevel-id'),
         'applet': ('object-type', 'applet-iid', 'toplevel-id', 'position', 'locked'),
         'menu-bar': ('object-type', 'applet-iid', 'toplevel-id', 'position', 'locked'),
         'menu': ('object-type', 'toplevel-id', 'position', 'locked'),
         'action': ('object-type', 'action-type', 'position', 'toplevel-id'),
         'separator': ('object-type', 'panel-right-stick', 'position', 'toplevel-id')}

schemas = {'panel': 'org.mate.panel',
           'object': 'org.mate.panel.object',
           'toplevel':'org.mate.panel.toplevel'}

paths = {'object': '/org/mate/panel/objects/',
         'toplevel': '/org/mate/panel/toplevels/'}

general_settings = Gio.Settings.new(schemas['panel'])

toplevel_ids = general_settings['toplevel-id-list']
object_ids = general_settings['object-id-list']

layout = []

for toplevel in toplevel_ids:
    settings = Gio.Settings.new_with_path(
        schemas['toplevel'],
        paths['toplevel'] + toplevel + '/')

    layout.append("[Toplevel %s]\n" % toplevel)

    for key in settings.keys():
        val = settings[key]
        if key in VALID['toplevel']:
            layout.append("%s=%s\n" % (key, val))
    layout.append("\n")

for obj in object_ids:
    settings = Gio.Settings.new_with_path(
        schemas['object'],
        paths['object'] + obj + '/')

    obj_toplevel = settings['toplevel-id']
    obj_type = settings['object-type']
    obj_name = ""
    if obj_type == "applet":
        obj_name = settings['applet-iid'].split(":")[-1]
    elif obj_type == "action":
        obj_name = settings['action-type']
    else:
        obj_name = obj_type

    if not obj_toplevel in toplevel_ids:
        print("WARNING object \"%s\" references unknown toplevel... skipped" % obj_name)
        continue
        
    layout.append("[Object %s]\n" % obj_name.lower())
    for key in settings.keys():
        if key in VALID[obj_type]:
            val = settings[key]
            layout.append("%s=%s\n" % (key, val))
    layout.append("\n")

with open(os.path.expanduser("~") + '/dump.layout', 'w') as fobj:
    fobj.writelines(layout)