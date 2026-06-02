module config.kdrive_config;


import build.dix_config;

/* Build the kdrive keyboard input driver */
enum KDRIVE_KBD = 1;

/* Build the kdrive mouse input driver */
enum KDRIVE_MOUSE = 1;

/* Build the kdrive evdev input driver */
enum KDRIVE_EVDEV = 1;

/* Build the kdrive tslib input driver */
enum KDRIVE_TSLIB = 1;

// #endif /* _KDRIVE_CONFIG_H_ */
