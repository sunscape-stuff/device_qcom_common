## Goal

Thanks to the effort by some members of the AOSPA team, we introduce the repo that every device maintainer dreams of.
Since nowadays we're moving to commonized device trees, where most of the devices share the same requirements and blobs, we put together the most common QTI components in order to avoid duplicated configs all over the device trees, leaving them with a clean and more understandable device trees.

## SOCs supported per component

In order to a better understanding, here's a list of the components supported with the kernel families.

| QTI Component       | Kernel Families or Platforms supported            |
| ------------------- | :------------------------------------------------ |
| Adreno (U)          | 6.1                                               |
| Adreno (T)          | 5.15                                              |
| Adreno (S)          | 5.10                                              |
| Adreno (R)          | 4.14, 4.19, 5.4                                   |
| Adreno (5xx)        | 3.18. 4.4, msm8953                                |
| Alarm               | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Audio               | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Av                  | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Bt                  | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Display             | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Dlkm                | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| GPS                 | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Init                | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Media               | 5.10, 5.15                                        |
| Media-5.4           | 5.4                                               |
| Media Legacy        | 3.18, 4.4, 4.9, 4.14, 4.19                        |
| NFC                 | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Overlay             | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Perf                | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Telephony           | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| USB                 | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| Vibrator            | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| WFD                 | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4, 5.10, 5.15, 6.1  |
| WLAN                | 5.10, 5.15                                        |
| WLAN Legacy         | 3.18, 4.4, 4.9, 4.14, 4.19, 5.4                   |

Something to keep in mind is that, the components are configured specifically to check for your SOCs kernel family, this way we can use the right components for that SOC, here's an example:

  > TARGET_COMMON_QTI_COMPONENTS := \
  > media \

In this example, the variant of the ``media`` component depends on the kernel family that the device's SOC is part of, so if you have 5.4, it will automatically use ``media-5.4``, the same applies for all the other componets such as ``wlan``, ``gps`` and ``adreno``.


## Kernel Families

In case you're too lazy to go into common.mk, here's a list of the kernel families per soc.

| Kernel Family | SOCs                                        |
| ------------- | :------------------------------------------ |
| 6.1           | pineapple                                   |
| 5.15          | monaco, kalama, crow                        |
| 5.10          | parrot, taro                                |
| 5.4           | holi, lahaina                               |
| 4.19          | bengal, kona, lito                          |
| 4.14          | sm6150, trinket, atoll, msmnile, msmnile_au |
| 4.9           | msm8953, qcs605, sdm710, sdm845             |
| 4.4           | msm8998, sdm660                             |
| 3.18          | msm8937, msm8996                            |

## Advices

- Remember to always check the proprietary-files of each component you'll use in order to avoid duplicate stuff in your device trees.
- Check also the qti-*.mk to see the defined flags and components called
- In order to call the components you'll do it via "TARGET_COMMON_QTI_COMPONENTS" in your device.mk
- If you wish to add all of the components use "all" in the qti components only

## Examples

- Using only specific components
  > TARGET_COMMON_QTI_COMPONENTS := \
  > adreno \
  > wlan

- Using all the components you only need this
  > TARGET_COMMON_QTI_COMPONENTS := all

Copyright (C) 2023 Paranoid Android
