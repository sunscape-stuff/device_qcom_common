# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set the path to the Qualcomm common vibrator.
QCOM_COMMON_VIBRATOR := vendor/qcom/opensource/vibrator

# Allow a device to manually override the vibrator it should use.
ifneq ($(OVERRIDE_QCOM_COMMON_VIBRATOR),)
QCOM_COMMON_VIBRATOR := $(OVERRIDE_QCOM_COMMON_VIBRATOR)
endif

# Vibrator
$(call inherit-product, $(QCOM_COMMON_VIBRATOR)/vibrator-vendor-product.mk)
