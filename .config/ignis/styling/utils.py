def hex_to_rgba(hex: str):
    h = hex.lstrip('#')
    if len(h) == 6:
        r, g, b = tuple(int(h[i:i+2], 16)/255 for i in (0, 2, 4))
        return (r, g, b, 1.0)
    elif len(h) == 8:
        return tuple(int(h[i:i+2], 16)/255 for i in (0, 2, 4, 6))
    else:
        raise ValueError("invalid format")
