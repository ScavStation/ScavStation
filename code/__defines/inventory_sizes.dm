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

// Defines mob sizes, used by lockers and to determine what is considered a small sized mob, etc.
#define MOB_SIZE_MINISCULE  ITEM_SIZE_NORMAL
#define MOB_SIZE_TINY       ITEM_SIZE_HUGE
#define MOB_SIZE_SMALL      ITEM_SIZE_GARGANTUAN
#define MOB_SIZE_MEDIUM     MOB_SIZE_SMALL  * 2
#define MOB_SIZE_LARGE      MOB_SIZE_MEDIUM * 2

// Normalize arbitrary w_class to a linear integer sequence for use in older code that relies on magic numbers.
#define ITEM_SIZE_MIN            ITEM_SIZE_TINY
#define ITEM_SIZE_MAX            ITEM_SIZE_GARGANTUAN

// Storage defines!
#define BASE_STORAGE_COST(w_class) (2**(CONSTANT_MAX(0, (w_class-1))))
#define BASE_STORAGE_CAPACITY(w_class) (7*w_class)

#define DEFAULT_BACKPACK_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_HUGE)
#define DEFAULT_LARGEBOX_STORAGE BASE_STORAGE_CAPACITY(ITEM_SIZE_LARGER)
#define DEFAULT_BOX_STORAGE      BASE_STORAGE_CAPACITY(ITEM_SIZE_LARGE)
