/* This file is part of the ATMEL AVR32-SoftwareFramework-AT32UC3-1.6.0 Release */

/*This file is prepared for Doxygen automatic documentation generation.*/
/*! \file *********************************************************************
 *
 * \brief AVR32 UC3 ISP trampoline dedicated for AT32UC3C0512C rev C.
 *
 * In order to be able to program a project with both BatchISP and JTAGICE mkII
 * without having to take the general-purpose fuses into consideration, add this
 * file to the project and change the program entry point to _trampoline.
 *
 * The pre-programmed ISP will be erased if JTAGICE mkII is used.
 *
 * - Compiler:           GNU GCC for AVR32
 * - Supported devices:  All AVR32UC devices can be used.
 *
 * \author               Atmel Corporation: http://www.atmel.com \n
 *                       Support and FAQ: http://support.atmel.no/
 *
 ******************************************************************************/

/* Copyright (c) 2009 Atmel Corporation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * 3. The name of Atmel may not be used to endorse or promote products derived
 * from this software without specific prior written permission.
 *
 * 4. This software may only be redistributed and used in connection with an Atmel
 * AVR product.
 *
 * THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * EXPRESSLY AND SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 *
 */

#include "conf_isp.h"


//! @{
//! \verbatim


  // Performs efficiently a bitwise logical Exclusive-OR between the specified
  // register and an immediate value of up to 32 bits. The result is stored in
  // the destination register.
  .macro  eor.w   rd, imm
    .if \imm & 0x0000FFFF
      eorl    \rd, LO(\imm)
    .endif
    .if \imm & 0xFFFF0000
      eorh    \rd, HI(\imm)
    .endif
  .endm

  // Moves efficiently an immediate value of up to 32 bits into a register.
  .macro  mov.w   rd, imm
    .if ((-(1 << (21 - 1))) <= \imm) && (\imm <= ((1 << (21 - 1)) - 1))
      mov     \rd, \imm
#if __AVR32_UC__ >= 2
    .elseif !(\imm & 0x0000FFFF)
      movh    \rd, HI(\imm)
#endif
    .else
      mov     \rd, LO(\imm)
      orh     \rd, HI(\imm)
    .endif
  .endm

  // Performs efficiently a bitwise logical OR between the specified register
  // and an immediate value of up to 32 bits. The result is stored in the
  // destination register.
  .macro  or.w    rd, imm
    .if \imm & 0x0000FFFF
      orl     \rd, LO(\imm)
    .endif
    .if \imm & 0xFFFF0000
      orh     \rd, HI(\imm)
    .endif
  .endm

  .section  .reset, "ax", @progbits

  .balign 2
  
  .global _trampoline
  .type _trampoline, @function
_trampoline:
  // Workaround for AT32UC3C0512C revC - Disable WDT at startup
  mov.w   r8, 0x55000000
  mov.w   r9, 0xAA000000
  mov.w   r10, AVR32_WDT_ADDRESS
  st.w    r10[AVR32_WDT_CTRL], r8
  st.w    r10[AVR32_WDT_CTRL], r9  
  // Jump to program start.
  rjmp    program_start

  .org  PROGRAM_START_OFFSET
program_start:
  // Jump to the C runtime startup routine.
  lda.w   pc, _stext


//! \endverbatim
//! @}