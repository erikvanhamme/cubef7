# Copyright 2015 Erik Van Hamme
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# module.mk descriptor for the cubef7 library.
#

# The library cannot be used unless an stm32f7 chip is selected.
ifneq ($(strip $(findstring STM32F7,$(use))),)

# Set the arch for the build.
arch := -mcpu=cortex-m7 -mthumb -mfloat-abi=softfp -mfpu=fpv5-sp-d16

# --- Drivers -----------------------------------------------------------------

# BSP module.
#include cubef7/bsp.mk

# CMSIS module.
include cubef7/cmsis.mk

# HAL module.
#include cubef7/hal.mk

# --- Middlewares -------------------------------------------------------------

# FreeRTOS module.
#include cubef7/freertos.mk

# LwIP module.
#include cubef7/lwip.mk

# --- Utilities ---------------------------------------------------------------

# Fonts.
#include cubef7/fonts.mk

# LCD Log
#include cubef7/log.mk

# Stubs.
include cubef7/stubs.mk

endif # End of STM32F7
