#ifndef NEON_SYMBOLIC_MEMORY_H
#define NEON_SYMBOLIC_MEMORY_H

#include "../symbolic_common.h"
#include "types.h"
#include <stdint.h>
#include <stdlib.h>

/**
 * Memory entry: stores a list of vectors at a given address
 */
typedef struct {
    int32x4_t* vectors;
    size_t count;
    size_t capacity;
} neon_memory_entry_t;

/**
 * Simple hash map for memory tracking
 * In C, we'll use a simple dynamic array with linear search
 * For production, consider using a proper hash map library
 */
typedef struct {
    uintptr_t address;
    neon_memory_entry_t entry;
} neon_memory_slot_t;

typedef struct {
    neon_memory_slot_t* slots;
    size_t count;
    size_t capacity;
} neon_memory_map_t;

// Global memory map
extern neon_memory_map_t g_neon_memory;

// Initialize the memory map
void neon_memory_init(neon_memory_map_t* map);

// Find or create entry for an address
neon_memory_entry_t* neon_memory_get(neon_memory_map_t* map, uintptr_t addr);

// Add a vector to memory at an address
void neon_memory_push(neon_memory_map_t* map, uintptr_t addr, int32x4_t vec);

// Get the last stored vector at an address (returns NULL if none)
int32x4_t* neon_memory_get_last(neon_memory_map_t* map, uintptr_t addr);

// Clear all memory
void neon_memory_clear(neon_memory_map_t* map);

// Free all memory
void neon_memory_free(neon_memory_map_t* map);

#endif // NEON_SYMBOLIC_MEMORY_H
