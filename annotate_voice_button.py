from PIL import Image, ImageDraw, ImageFont

src = r"C:\Users\Pc\AppData\Local\Temp\codex-clipboard-cb289593-523d-4801-bee9-81bb08d62f68.png"
dst = r"C:\Users\Pc\Documents\volverAaprender\codex-voice-button-annotated.png"

img = Image.open(src).convert("RGBA")
draw = ImageDraw.Draw(img)

# Highlight the visible “Start new voice chat” control near the top-left of the main pane.
box = (292, 38, 472, 78)
draw.rounded_rectangle(box, radius=8, outline=(255, 55, 55, 255), width=6)

# Large arrow pointing to the control.
start = (650, 145)
end = (475, 70)
draw.line([start, end], fill=(255, 55, 55, 255), width=8)
head = [(end[0], end[1]), (end[0] + 28, end[1] + 2), (end[0] + 12, end[1] + 27)]
draw.polygon(head, fill=(255, 55, 55, 255))

try:
    font = ImageFont.truetype(r"C:\Windows\Fonts\arialbd.ttf", 28)
except OSError:
    font = ImageFont.load_default()
draw.rounded_rectangle((655, 128, 825, 174), radius=8, fill=(255, 55, 55, 230))
draw.text((668, 136), "HAZ CLIC AQUÍ", font=font, fill="white")

img.convert("RGB").save(dst, quality=95)
print(dst)
