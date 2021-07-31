#include "include/eyro_toast/eyro_toast_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>
#include <sys/utsname.h>

#include <cstring>

#define EYRO_TOAST_PLUGIN(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), eyro_toast_plugin_get_type(), \
                              EyroToastPlugin))

struct _EyroToastPlugin {
  GObject parent_instance;
};

G_DEFINE_TYPE(EyroToastPlugin, eyro_toast_plugin, g_object_get_type())

// Called when a method call is received from Flutter.
static void eyro_toast_plugin_handle_method_call(
    EyroToastPlugin* self,
    FlMethodCall* method_call) {
  g_autoptr(FlMethodResponse) response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());

  fl_method_call_respond(method_call, response, nullptr);
}

static void eyro_toast_plugin_dispose(GObject* object) {
  G_OBJECT_CLASS(eyro_toast_plugin_parent_class)->dispose(object);
}

static void eyro_toast_plugin_class_init(EyroToastPluginClass* klass) {
  G_OBJECT_CLASS(klass)->dispose = eyro_toast_plugin_dispose;
}

static void eyro_toast_plugin_init(EyroToastPlugin* self) {}

static void method_call_cb(FlMethodChannel* channel, FlMethodCall* method_call,
                           gpointer user_data) {
  EyroToastPlugin* plugin = EYRO_TOAST_PLUGIN(user_data);
  eyro_toast_plugin_handle_method_call(plugin, method_call);
}

void eyro_toast_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  EyroToastPlugin* plugin = EYRO_TOAST_PLUGIN(
      g_object_new(eyro_toast_plugin_get_type(), nullptr));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) channel =
      fl_method_channel_new(fl_plugin_registrar_get_messenger(registrar),
                            "eyro_toast",
                            FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(channel, method_call_cb,
                                            g_object_ref(plugin),
                                            g_object_unref);

  g_object_unref(plugin);
}
