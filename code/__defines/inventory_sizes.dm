// Skull wrote this apparently, thanks Skull!
#define MAP(x, imin, imax, omin, omax) ((x - imin) * (omax - omin) / (imax - imin) + omin)

// Material value defines.
#define SHEET_MATERIAL_AMOUNT 2500
#define SHEET_UNIT "<small>cm<sup>3</sup></small>"

// The below should be used to define an item's w_class variable.
// Example: w_class = ITEM_SIZE_LARGE
// This allows the addition of future w_classes without needing to change every file.

#define ITEM_SIZE_TINY           0.5
#define ITEM_SIZE_SMALL          0.75
#define ITEM_SIZE_NORMAL         1
#define ITEM_SIZE_LARGE          2
#define ITEM_SIZE_LARGER         3
#define ITEM_SIZE_HUGE           4
#define ITEM_SIZE_GARGANTUAN     8
#define ITEM_SIZE_NO_CONTAINER   INFINITY

// Normalize arbitrary w_class to a linear integer sequence for use in older code that relies on magic numbers.
#define ITEM_SIZE_MIN            ITEM_SIZE_TINY
#define ITEM_SIZE_MAX            ITEM_SIZE_GARGANTUAN
#define LEGACY_ITEM_SIZE_MIN     1
#define LEGACY_ITEM_SIZE_MAX     6
#define NORMALIZE_ITEM_SIZE(X)   CONSTANT_ROUND(MAP((X), ITEM_SIZE_MIN, ITEM_SIZE_MAX, LEGACY_ITEM_SIZE_MIN, LEGACY_ITEM_SIZE_MAX))

// Storage defines!
#define BASE_STORAGE_COST(w_class) (2**(max(0, (w_class-1))))
#define BASE_STORAGE_CAPACITY(w_class) (7*w_class)

#define DEFAULT_BACKPACK_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_HUGE)
#define DEFAULT_LARGEBOX_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_LARGER)
#define DEFAULT_BOX_STORAGE      BASE_STORAGE_CAPACITY(ITEM_SIZE_LARGE)
