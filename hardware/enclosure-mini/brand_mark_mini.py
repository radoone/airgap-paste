"""Parametric brand mark for the Mini AirGap Paste button.

Wi-Fi/BLE source -> air gap -> USB-C output.
Proportionally scaled for the compact Ø46mm button.
"""

TOUCH_SURFACE_Z = 19.5
MARK_CENTER_Y = 7.2
EMBOSS_Z = TOUCH_SURFACE_Z - 0.02
EMBOSS_HEIGHT = 0.52
SOURCE_X = -5.0
SOURCE_RADIUS = 0.9
WIFI_RADII = (2.4, 3.8)
WIFI_STROKE = 0.9

def add_emboss(cq, top, cy, bx):
    """Fuse the Wi-Fi -> air gap -> USB-C mark into the touch surface."""
    def polygon(points):
        return cq.Workplane("XY").polyline(points).close().extrude(EMBOSS_HEIGHT).translate((0, 0, EMBOSS_Z))

    mark = cy(SOURCE_RADIUS, EMBOSS_HEIGHT, EMBOSS_Z, SOURCE_X, MARK_CENTER_Y)
    for radius in WIFI_RADII:
        arc = cy(radius, EMBOSS_HEIGHT, EMBOSS_Z, SOURCE_X, MARK_CENTER_Y).cut(
            cy(radius - WIFI_STROKE, EMBOSS_HEIGHT + .02, EMBOSS_Z - .01, SOURCE_X, MARK_CENTER_Y)
        )
        arc = arc.cut(bx(15, 15, 1, 2.0, MARK_CENTER_Y, EMBOSS_Z - .18))
        mark = mark.union(arc)

    arrow = [(-1.5, 7.8), (0.2, 7.8), (0.2, 8.8), (2.3, MARK_CENTER_Y),
             (0.2, 5.6), (0.2, 6.6), (-1.5, 6.6)]
    mark = mark.union(polygon(arrow))

    usb = bx(3.6, 3.8, EMBOSS_HEIGHT, 4.4, MARK_CENTER_Y, EMBOSS_Z).cut(
        bx(1.1, 2.3, EMBOSS_HEIGHT + .02, 4.0, MARK_CENTER_Y, EMBOSS_Z - .01)
    )
    return top.union(mark).union(usb)

def proof_geometry():
    """Return 2D primitives used by the preview image and documentation."""
    return {
        "source": (SOURCE_X, MARK_CENTER_Y, SOURCE_RADIUS),
        "wifi_radii": WIFI_RADII,
        "wifi_stroke": WIFI_STROKE,
        "arrow": [(-1.5, 7.8), (0.2, 7.8), (0.2, 8.8), (2.3, MARK_CENTER_Y),
                  (0.2, 5.6), (0.2, 6.6), (-1.5, 6.6)],
        "usb": (2.6, 5.3, 3.6, 3.8),
        "usb_opening": (3.45, 6.05, 1.1, 2.3),
    }
