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
# Support for the CMSIS module.
#

# Include CMSIS support if the use flags say so.
ifneq ($(strip $(findstring CMSIS,$(use))),)

# Include paths for the CMSIS.
systemincludes += \
        cubef7/Drivers/CMSIS/Device/ST/STM32F7xx/Include \
        cubef7/Drivers/CMSIS/Include \

# Main CMSIS system file.
systemsources += cubef7/Drivers/CMSIS/Device/ST/STM32F7xx/Source/Templates/system_stm32f7xx.c

# ---- Chip support -----------------------------------------------------------
# Start by loading the chip data.
include cubef7/chipdata.mk

# If the chip is not in the supported list, throw an error
ifeq ($(filter $(supported_chips),$(chip)),)
$(error Unsupported chip specified)
endif

ifneq ($(filter -DSTM32F745xx,$(defines)),)
systemsources += cubef7/Drivers/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.s
endif

ifneq ($(filter -DSTM32F746xx,$(defines)),)
systemsources += cubef7/Drivers/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.s
endif

ifneq ($(filter -DSTM32F756xx,$(defines)),)
systemsources += cubef7/Drivers/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.s
endif


endif # End of CMSIS
