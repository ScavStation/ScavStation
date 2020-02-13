// Skull wrote this apparently, thanks Skull!
#define MAP(x, imin, imax, omin, omax) ((x - imin) * (omax - omin) / (imax - imin) + omin)

// Material value defines.
#define SHEET_MATERIAL_AMOUNT 2500
#define SHEET_UNIT "<small>cm<sup>3</sup></small>"

// The below should be used to define an item's w_class variable.
// Example: w_class = ITEM_SIZE_LARGE
// This allows the addition of future w_classes without needing to change every file.

#define ITEM_SIZE_TINY           1
#define ITEM_SIZE_SMALL          2
#define ITEM_SIZE_NORMAL         3
#define ITEM_SIZE_LARGE          4
#define ITEM_SIZE_HUGE           5
#define ITEM_SIZE_GARGANTUAN     6
#define ITEM_SIZE_NO_CONTAINER INFINITY // Use this to forbid item from being placed in a container.

// Normalize arbitrary w_class to a linear integer sequence for use in older code that relies on magic numbers.
#define ITEM_SIZE_MIN            ITEM_SIZE_TINY
#define ITEM_SIZE_MAX            ITEM_SIZE_GARGANTUAN

// Storage defines!
#define BASE_STORAGE_COST(w_class) (2**(w_class-1)) //1,2,4,8,16,...
//linear increase. Using many small storage containers is more space-efficient than using large ones,
//in exchange for being limited in the w_class of items that will fit
#define BASE_STORAGE_CAPACITY(w_class) (7*(w_class-1))

#define DEFAULT_BACKPACK_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_HUGE)
#define DEFAULT_LARGEBOX_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_LARGE)
#define DEFAULT_BOX_STORAGE      BASE_STORAGE_CAPACITY(ITEM_SIZE_NORMAL)
