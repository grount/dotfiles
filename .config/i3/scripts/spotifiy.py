#!/usr/bin/python
import dbus

def reverse_if_hebrew(string):
    if check_if_all_hebrew(string):
        return string[::-1]
    return string

def check_if_all_hebrew(s):
    return any(u"\u0590" <= c <= u"\u05EA" for c in s)        

try:
     bus = dbus.SessionBus()
     spotify = bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
     spotify_iface = dbus.Interface(spotify, 'org.freedesktop.DBus.Properties')
     props = spotify_iface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
     artist_name = props['xesam:artist'][0]
     song_title = props['xesam:title']
     song_title = reverse_if_hebrew(song_title)
     artist_name = reverse_if_hebrew(artist_name)
     print(artist_name + " - " + song_title).encode('utf-8')
     exit
except dbus.exceptions.DBusException:
    exit
