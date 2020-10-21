#include "libimagequant.h"

liq_attr *attr = liq_attr_create();
liq_image *image = liq_image_create_rgba(attr, example_bitmap_rgba, width, height, 0);
liq_result *res;
liq_image_quantize(image, attr, &res);

liq_write_remapped_image(res, image, example_bitmap_8bpp, example_bitmap_size);
const liq_palette *pal = liq_get_palette(res);

// Save the image and the palette now.
for(int i=0; i < pal->count; i++) {
    example_copy_palette_entry(pal->entries[i]);
}
// You'll need a PNG library to write to a file.
example_write_image(example_bitmap_8bpp);

liq_result_destroy(res);
liq_image_destroy(image);
liq_attr_destroy(attr);