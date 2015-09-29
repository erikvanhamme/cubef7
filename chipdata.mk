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
# This file stores the parameters of the various chips supported by this
# library.
#

# ---- STM32F7x5 family -------------------------------------------------------
# http://www.st.com/web/en/catalog/mmc/FM141/SC1169/SS1858/LN1958
supported_chips += \
	stm32f745xe \
	stm32f745xg \

ifeq ($(chip),stm32f745xe)
defines += -DSTM32F745xx
itcmsize := 16K
flashsize := 512K
dtcmsize := 64K
sramsize := 256K
endif #End of stm32f745xe

ifeq ($(chip),stm32f745xg)
defines += -DSTM32F745xx
itcmsize := 16K
flashsize := 1024K
dtcmsize := 64K
sramsize := 256K
endif #End of stm32f745xg


# ---- STM32F7x6 family
# http://www.st.com/web/en/catalog/mmc/FM141/SC1169/SS1858/LN1902
supported_chips += \
	stm32f746xe \
	stm32f746xg \
	stm32f756xe \

ifeq ($(chip),stm32f746xe)
defines += -DSTM32F746xx
itcmsize := 16K
flashsize := 512K
dtcmsize := 64K
sramsize := 256K
endif #End of stm32f746xe

ifeq ($(chip),stm32f746xg)
defines += -DSTM32F746xx
itcmsize := 16K
flashsize := 1024K
dtcmsize := 64K
sramsize := 256K
endif #End of stm32f746xg

ifeq ($(chip),stm32f756xg)
defines += -DSTM32F756xx
itcmsize := 16K
flashsize := 1024K
dtcmsize := 64K
sramsize := 256K
endif #End of stm32f756xg


