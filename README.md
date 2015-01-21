IVCProject
==========
Requirements:
-------------
1. Wenigstens ein Objekt in der Szene sollte bewegte Gliedmaßen haben.
2. Wenigstens eine Szene sollte die Kameraeinstellung variieren, z.B. in die Szene hineinfahren, schwenken oder zoomen.
3. Setzen Sie ein verarbeitetes Bild ein, z.B. als Höhenprofil, Kulisse oder Textur.
4. Erstellen sie einen animierten Titel.
5. Setzen Sie Überblendungen ein, um den Schnitt zwischen zwei Kamerapositionen oder anderen Bildwechseln zu betonen oder zu kaschieren.
6. Setzen Sie Sound-Effekte zum Vertonen ein.

Development notes:
------------------
1 Povray distance unit corresponds to 1 meter in reality.
1 Povray clock unit corresponds to 1 second in reality.

ca. maximum speed of a squash ball of hobby player: 42 m/s

Animationsreihenfolge:
1. Animation6
2. Animation5
3. Animation3

To use debug output:
```
#debug concat("clk: ",str(clk, 0, 5),"\n")
#debug concat("camera position = ",vstr(3, CamPos,", ",0,3),"\n")
```

For h264 codec in matroska format
```
mencoder "mf://*.png" -mf fps=50:type=png -o output.mkv -ovc x264 -of lavf
```

tmp:
```
end_clock = (z_val - p_start.z)/(v_start * cos(radians(vert_angle)))
```
