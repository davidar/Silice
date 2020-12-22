// -----------------------------------------------------------
// @sylefeb A SDRAM controller in Silice
//
// SDRAM interface definitions
//

// -----------------------------------------------------------

// SDRAM, r128w8 data exchange (1 byte write, 16 bytes burst read)
group sdram_r128w8_io
{
  uint26  addr       = 0,  // addressable bytes (internally deals with 16 bits wide sdram)
  uint1   rw         = 0,  // 0: read 1: write
  uint8   data_in    = 0,  //   8 bits write
  uint1   in_valid   = 0,  // pulse high to request a read/write
  uint128 data_out   = 0,  // 128 bits read (8x burst of 16 bits)
  uint1   done       = 0   // pulses high when done, both for reads and writes
}

// SDRAM, byte data exchange

group sdram_byte_io
{
  uint26  addr       = 0,
  uint1   rw         = 0,
  uint8   data_in    = 0,
  uint1   in_valid   = 0,
  uint8   data_out   = 0,
  uint1   done       = 0
}

// => NOTE how sdram_raw_io and sdram_byte_io are compatible in terms of named members
//         this allows using the same interface for both

// Interfaces

// interface for user
interface sdram_user {
  output  addr,
  output  rw,
  output  data_in,
  output  in_valid,
  input   data_out,
  input   done,
}

// interface for provider
interface sdram_provider {
  input   addr,
  input   rw,
  input   data_in,
  input   in_valid,
  output  data_out,
  output  done
}

// -----------------------------------------------------------
