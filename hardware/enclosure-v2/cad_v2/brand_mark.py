"""Editable AirGap Paste brand mark for the enclosure top.

The mark reads Wi-Fi/BLE source → air gap → USB-C output.  Dimensions are
kept here so its physical size can be tuned without changing the enclosure.
"""

MARK_CENTER_Y = 10.8
EMBOSS_Z = 24.98
EMBOSS_HEIGHT = 0.62
SOURCE_X = -7.2
SOURCE_RADIUS = 1.25
WIFI_RADII = (3.35, 5.15)
WIFI_STROKE = 1.25


def add_emboss(cq, top, cy, bx):
    """Fuse the print-safe 17 mm Wi-Fi → air gap → USB-C mark into ``top``."""
    def polygon(points):
        return cq.Workplane("XY").polyline(points).close().extrude(EMBOSS_HEIGHT).translate((0, 0, EMBOSS_Z))

    mark = cy(SOURCE_RADIUS, EMBOSS_HEIGHT, EMBOSS_Z, SOURCE_X, MARK_CENTER_Y)
    for radius in WIFI_RADII:
        arc = cy(radius, EMBOSS_HEIGHT, EMBOSS_Z, SOURCE_X, MARK_CENTER_Y).cut(
            cy(radius - WIFI_STROKE, EMBOSS_HEIGHT + .02, EMBOSS_Z - .01, SOURCE_X, MARK_CENTER_Y)
        )
        # Remove the right half: the open side faces the physical air gap.
        arc = arc.cut(bx(20, 20, 1, 2.8, MARK_CENTER_Y, EMBOSS_Z - .18))
        mark = mark.union(arc)

    arrow = [(-2.2, 11.7), (.25, 11.7), (.25, 13.0), (3.2, MARK_CENTER_Y),
             (.25, 8.6), (.25, 9.9), (-2.2, 9.9)]
    mark = mark.union(polygon(arrow))

    # Deliberately robust USB-C silhouette with a recessed opening.
    usb = bx(4.8, 5.0, EMBOSS_HEIGHT, 5.85, MARK_CENTER_Y, EMBOSS_Z).cut(
        bx(1.45, 3.05, EMBOSS_HEIGHT + .02, 5.25, MARK_CENTER_Y, EMBOSS_Z - .01)
    )
    return top.union(mark)


def proof_geometry():
    """Return 2D primitives used by the preview image and documentation."""
    return {
        "source": (SOURCE_X, MARK_CENTER_Y, SOURCE_RADIUS),
        "wifi_radii": WIFI_RADII,
        "wifi_stroke": WIFI_STROKE,
        "arrow": [(-2.2, 11.7), (.25, 11.7), (.25, 13.0), (3.2, MARK_CENTER_Y),
                  (.25, 8.6), (.25, 9.9), (-2.2, 9.9)],
        "usb": (3.45, 8.3, 4.8, 5.0),
        "usb_opening": (4.525, 9.275, 1.45, 3.05),
    }
