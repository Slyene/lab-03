lgi = require 'lgi'
--Chesnokov 474
gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03.glade')

prov = gtk.CssProvider()
prov:load_from_path('lab-03.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects
--Chesnokov 474
opt = {ui.rbA, ui.rbB, ui.rbC, ui.rbD}

function update()
    x = 0
    y = 0
    if ui.chkX.active == true then x = 1 end
    if ui.chkY.active == true then y = 1 end

    v = x + y * 2
    opt[v + 1].active = true

    ui.lblValue.label = v
end

function ui.chkX:on_clicked(...)
    update()
end

function ui.chkY:on_clicked(...)
    update()
end
--Chesnokov 474
ui.wnd.title = 'lab-03'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
