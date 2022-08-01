## The official group logo

Please use the official group logo in a suitable form, color and format
as available via this repository (shades of blue, greyscale, or black/white).

The two shades of blue are:

  - light blue "Air Superiority Blue"
    - hex: 819EBB
    - RGB: 129,158,187
    - CMYK: 31,16,0,27
  - dark blue "Prussian Blue"
    - hex: 0B2E4F
    - RGB: 11,46,79
    - CMYK: 86,42,0,69

Files named "-logo" include the "Marschall Lab" lettering. Files named "-icon" only
include the "ML". The "Marschall Lab" lettering has a transparent background in files
named "full-transp", and a solid background otherwise.

### .ico versions

Favicon(s) were created starting from the file `ML-icon_blue_solid_w400xh400_150dpi.png`
using `ImageMagick 6.9.10-23` as follows:

```
convert ML-icon_blue_solid_w400xh400_150dpi.png -alpha off -resize 256x256 -define icon:auto-resize="256,128,96,64,48,32,16" favicon.ico
```

The file `favicon_256x256.ico` is a copy of the file above, and all other icon files were created in the same manner.