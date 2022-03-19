include libherb

type
  HerbServer* = object
    server: ptr wl_display
    backend: ptr wlr_backend
    renderer: ptr wlr_renderer
    allocator: ptr wlr_allocator
    scene: ptr wlr_scene
    xdg_shell: ptr wlr_xdg_shell
    seat: ptr wlr_seat
    cursor: ptr wlr_cursor
    cursor_manager: ptr wlr_xcursor_manager
    compositor: ptr wlr_compositor
    data_device_manager: ptr wlr_data_device_manager

proc init_server():HerbServer = 

  var server = wl_display_create();
  var backend = wlr_backend_autocreate(server);
  var renderer = wlr_renderer_autocreate(backend);
  var allocator = wlr_allocator_autocreate(backend, renderer);
  var scene = wlr_scene_create();
  var xdg_shell = wlr_xdg_shell_create(server);
  var seat = wlr_seat_create(server, "herbwm-seat0");
  var cursor = wlr_cursor_create();
  var cursor_manager = wlr_xcursor_manager_create(nil, 24);
  var compositor = wlr_compositor_create(server, renderer);
  var data_device_manager = wlr_data_device_manager_create(server);

  return HerbServer(
    server: server,
    backend: backend,
    renderer: renderer,
    allocator: allocator,
    scene: scene,
    xdg_shell: xdg_shell,
    seat: seat,
    cursor: cursor,
    cursor_manager: cursor_manager,
    compositor: compositor,
    data_device_manager: data_device_manager,
  )
