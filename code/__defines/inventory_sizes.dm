#define SHEET_MATERIAL_AMOUNT 2500
#define SHEET_UNIT "cm<sup>3</sup>"
#define ITEM_SIZE_TO_SHEET_AMOUNT_MULTIPLIER 0.5

// The below should be used to define an item's w_class variable.
// Example: w_class = ITEM_SIZE_LARGE
// This allows the addition of future w_classes without needing to change every file.

#define ITEM_SIZE_TINY           0.5
#define ITEM_SIZE_SMALL          0.75
#define ITEM_SIZE_NORMAL         1
#define ITEM_SIZE_LARGE          2
#define ITEM_SIZE_HUGE           4
#define ITEM_SIZE_GARGANTUAN     8
#define ITEM_SIZE_MAX            ITEM_SIZE_GARGANTUAN
#define ITEM_SIZE_NO_CONTAINER   INFINITY // Use this to forbid item from being placed in a container.

// Normalize arbitrary w_class to a linear integer sequence for use in older code that relies on magic numbers.
#define LEGACY_ITEM_SIZE_MIN 1
#define LEGACY_ITEM_SIZE_MAX 6
#define NORMALIZE_ITEM_SIZE(X) (ROUND((X/ITEM_SIZE_MAX)*LEGACY_ITEM_SIZE_MAX))

// Storage defines!
#define BASE_STORAGE_COST(w_class) (2**(NORMALIZE_ITEM_SIZE(w_class)-1)) //1,2,4,8,16,...

//linear increase. Using many small storage containers is more space-efficient than using large ones,
//in exchange for being limited in the w_class of items that will fit
#define BASE_STORAGE_CAPACITY(w_class) (7*(NORMALIZE_ITEM_SIZE(w_class)-1))

#define DEFAULT_BACKPACK_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_HUGE)
#define DEFAULT_LARGEBOX_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_LARGE)
#define DEFAULT_BOX_STORAGE      BASE_STORAGE_CAPACITY(ITEM_SIZE_NORMAL)
