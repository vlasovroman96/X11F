An ongoing effort to port the XLibre X server from C to D.

<img width="1920" height="1080" alt="Снимок экрана_20260921_222641" src="https://github.com/user-attachments/assets/00877e17-561c-4f48-9f4f-383a7fc6cf71" />

X Server on Dlang running under ArchLinux VBox VM.

## Status
**32/78 cases passed** (at 09/21/2026)

- ✅ Passed
  
- *Log/simptomes*: Failed/problems
- ❔ Not tested yet

## Test cases

| # | Test | Command | Status |
|---:|---|---|:---:|
| 1 | xdpyinfo | `xdpyinfo` | ✅ |
| 2 | xlsatoms | `xlsatoms` | ✅ |
| 3 | xset | `xset q` | ✅ |
| 4 | xwininfo root | `xwininfo -root` | ✅ |
| 5 | xprop root | `xprop -root` | ✅ |
| 6 | xmessage | `xmessage "Hello"` | ✅ |
| 7 | xwininfo tree | `xwininfo -root -tree` | ✅ |
| 8 | xwininfo window | `xwininfo -id <ID> -all` | ✅|
| 9 | xprop window | `xprop -id <ID>` | ✅ |
| 10 | xmessage multiline | `xmessage -buttons OK $'A\nB\nC'` | ✅|
| 11 | xlsclients | `xlsclients` | ✅ |
| 12 | xkill | `xkill` | ✅ |
| 13 | xsetroot solid | `xsetroot -solid red` | ✅ |
| 14 | xsetroot color | `xsetroot -solid white` | ✅  |
| 15 | xsetroot pattern | `xsetroot -mod 16 8` | ✅  |
| 16 | xlogo | `xlogo` | ✅ |
| 17 | xclock | `xclock` | ✅ |
| 18 | xrefresh | `xrefresh` | ✅ |
| 19 | xmessage colors | `xmessage -fg white -bg black "Test"` | ✅ |
| 20 | x11perf rect | `x11perf -rect500` | X Error of failed request:  BadMatch (invalid parameter attributes) Major opcode of failed request:  73 (X_GetImage) Serial number of failed request:  26 Current serial number in output stream:  26 |
| 21 | x11perf line | `x11perf -line500` | ⬜ |
| 22 | x11perf arc | `x11perf -arc500` | ❔|
| 23 | x11perf fill | `x11perf -fillrect500` | ❔|
| 24 | x11perf text | `x11perf -text500` | ❔ |
| 25 | x11perf copy | `x11perf -copywinwin500` | ❔|
| 26 | xev | `xev` | ✅ |
| 27 | xev structure | `xev -event structure` | ✅ |
| 28 | xev focus | `xev -event focus` | ❔|
| 29 | xev property | `xev -event property` | ✅ |
| 30 | xinput list | `xinput list` | ✅ |
| 31 | xev keyboard | `xev -event keyboard` | ✅ |
| 32 | xev pointer | `xev -event pointer` |✅|
| 33 | xinput pointer | `xinput test <ID>` |✅|
| 34 | xinput keyboard | `xinput test <ID>` | ✅ |
| 35 | xmodmap | `xmodmap -pm` | ❔|
| 36 | keymap | `xmodmap -pke` | ❔|
| 37 | XKB query | `setxkbmap -query` | ❔ |
| 38 | XKB print | `setxkbmap -print` | ❔ |
| 39 | XKB compile | `xkbcomp $DISPLAY -` | ❔ |
| 40 | xlsfonts | `xlsfonts` | ❔ |
| 41 | xfd | `xfd -fn fixed` | ❔ |
| 42 | xfontsel | `xfontsel` | ❔ |
| 43 | text rendering | `xmessage "The quick brown fox"` | ✅ |
| 44 | xclock digital | `xclock -digital` | X Error of failed request:  BadLength (poly) request too large or internal Xlib length error) Major opcode of failed request:  144 (RENDER) Minor opcode of failed request:  20 (RenderAddGlyphs) Serial number of failed request:  74 Current serial number in output stream:  104 |
| 45 | xwd root | `xwd -root -out /tmp/root.xwd` | ❔|
| 46 | xwd window | `xwd -id <ID> -out /tmp/window.xwd` | ❔ |
| 47 | xwud | `xwud -in /tmp/window.xwd` | ⬜ |
| 48 | xprop write/read | `xprop -id <ID> -set TEST abc` | ❔ |
| 49 | xclipboard | `xclipboard` | ❔ |
| 50 | xsel PRIMARY | `xsel --primary --input` / `xsel --primary --output` | ❔ |
| 51 | xsel CLIPBOARD | `xsel --clipboard --input` / `xsel --clipboard --output` | ❔ |
| 52 | xrandr query | `xrandr --query` | ❔|
| 53 | xrandr current | `xrandr --current` | ❔ |
| 54 | xrandr monitors | `xrandr --listmonitors` | ❔ |
| 55 | xrandr providers | `xrandr --listproviders` | ❔ |
| 56 | xrandr verbose | `xrandr --verbose` | ❔ |
| 57 | xeyes core | `xeyes +render +shape` | Two black region with one between them |
| 58 | xeyes +RENDER | `xeyes -render +shape` | ✅  |
| 59 | xeyes +SHAPE | `xeyes +render -shape` | Window not shown |
| 60 | xeyes both | `xeyes -render -shape` | ❔|
| 61 | xeyes default | `xeyes` | ❔ |
| 62 | SHAPE client | `<shape-test-client>` | ❔ |
| 63 | RENDER client | `<render-test-client>` | ❔ |
| 64 | XFixes client | `<xfixes-test-client>` | ❔ |
| 65 | Composite client | `<composite-test-client>` | ❔ |
| 66 | Damage client | `<damage-test-client>` | ❔ |
| 67 | xterm | `xterm` | Window not showing |
| 68 | xcalc | `xcalc` | ❔ |
| 69 | xedit | `xedit` | ❔ |
| 70 | multi-client | `xmessage A & xmessage B & xmessage C` | ✅ |
| 71 | xterm + xclock | `xterm & xclock` | ❔ |
| 72 | GLX | `glxinfo -B` | ❔|
| 73 | glxgears | `glxgears` | ❔ |
| 74 | DRI | `xdriinfo` | ❔ |
| 75 | long xclock | `timeout 10m xclock` | ✅ |
| 76 | long xterm | `timeout 10m xterm` | ✅|
| 77 | many windows | `for i in {1..50}; do xmessage "$i" & done` | ❔ |
| 78 | create/destroy | `for i in {1..100}; do xmessage "$i" -timeout 1 & done` | ❔ |
