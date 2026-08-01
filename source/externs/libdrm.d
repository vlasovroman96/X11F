module externs.libdrm;

// public import externs.
public import externs.drm;
// public import externs.drm_fourcc; 

public enum DRM_FORMAT_RGB565       = 0x36314752; // RG16
public enum DRM_FORMAT_XRGB8888     = 0x34325258; // XR24
public enum DRM_FORMAT_XRGB2101010  = 0x30335258; // XR30
public enum DRM_FORMAT_ARGB8888     = 0x34325241; // AR24
enum ulong DRM_FORMAT_MOD_INVALID = 0x00FFFFFFFFFFFFFFUL;