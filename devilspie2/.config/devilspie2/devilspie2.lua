debug_print("Window Name: " .. get_window_name());
debug_print("Application name: " .. get_application_name())
debug_print("Class instance name: " .. get_class_instance_name())
debug_print("Window class: " .. get_window_class())
debug_print("")

if (get_class_instance_name()=="urxvt-vis") then
    set_window_type("_NET_WM_WINDOW_TYPE_DESKTOP");
    undecorate_window();
    set_skip_tasklist(true);
    set_skip_pager(true);
    set_window_below();
    set_window_geometry(1950,800,500,200);
end
