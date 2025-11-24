#ifndef RISCV_SYMBOLIC_MEMORY_H
#define RISCV_SYMBOLIC_MEMORY_H

#include "../symbolic_common.h"
#include "types.h"
#include <stdint.h>
#include <stdlib.h>

/**
 * Global VL (vector length) for current operation
 * Set by vsetvl instructions, affects subsequent vector operations
 */
extern size_t g_current_vl;

/**
 * Memory entry: stores a list of vectors at a given address
 */
typedef struct {
    vint32m1_t* vectors;
    size_t count;
    size_t capacity;
} riscv_memory_entry_t;

/**
 * Simple hash map for memory tracking
 */
typedef struct {
    uintptr_t address;
    riscv_memory_entry_t entry;
} riscv_memory_slot_t;

typedef struct {
    riscv_memory_slot_t* slots;
    size_t count;
    size_t capacity;
} riscv_memory_map_t;

// Global memory map
extern riscv_memory_map_t g_riscv_memory;

// Initialize the memory map
void riscv_memory_init(riscv_memory_map_t* map);

// Find or create entry for an address
riscv_memory_entry_t* riscv_memory_get(riscv_memory_map_t* map, uintptr_t addr);

// Add a vector to memory at an address
void riscv_memory_push(riscv_memory_map_t* map, uintptr_t addr, vint32m1_t vec);

// Get the last stored vector at an address (returns NULL if none)
vint32m1_t* riscv_memory_get_last(riscv_memory_map_t* map, uintptr_t addr);

// Clear all memory
void riscv_memory_clear(riscv_memory_map_t* map);

// Free all memory
void riscv_memory_free(riscv_memory_map_t* map);

#endif // RISCV_SYMBOLIC_MEMORY_H
