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
# Support for the HAL module.
#

# Include HAL support if the use flags say so.
ifneq ($(strip $(findstring HAL,$(use))),)

# This define is needed by the stm32f7xx.h file.
defines += -DUSE_HAL_DRIVER

# Add main include paths for the HAL driver.
systemincludes += cubef7/Drivers/STM32F7xx_HAL_Driver/Inc

# Add all sources for the HAL driver.
systemsources += \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_adc.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_adc_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_can.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cec.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cortex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_crc.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_crc_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cryp.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cryp_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dac.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dac_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dcmi.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dcmi_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma2d.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_eth.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_hash.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_hash_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_hcd.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2s.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_irda.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_iwdg.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_lptim.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_ltdc.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_nand.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_nor.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pcd.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pcd_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_qspi.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rng.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rtc.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rtc_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sd.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sdram.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_smartcard.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_smartcard_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_spdifrx.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_spi.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sram.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim_ex.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_usart.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_wwdg.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_fmc.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_sdmmc.c \
	cubef7/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_usb.c \

endif # End of HAL driver
