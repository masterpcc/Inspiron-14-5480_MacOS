// Adding PNLF device for IntelBacklight.kext or AppleBacklight.kext+AppleBacklightFixup.kext
// This one is specific to CFL


DefinitionBlock("", "SSDT", 2, "hack", "_PNLFCFL", 0)
{
    // For backlight control
    Device(_SB.PCI0.GFX0.PNLF)
    {
        Name(_ADR, Zero)
        Name(_HID, EisaId("APP0002"))
        Name(_CID, "backlight")
        // _UID is set depending on PWMMax to match profiles in AppleBacklightFixup.kext Info.plist
        // 14: Sandy/Ivy 0x710
        // 15: Haswell/Broadwell 0xad9
        // 16: Skylake/KabyLake 0x56c (and some Haswell, example 0xa2e0008)
        // 17: custom LMAX=0x7a1
        // 18: custom LMAX=0x1499
        // 19: CoffeeLake 0xffff
        // 99: Other (requires custom AppleBacklightInjector.kext/AppleBackightFixup.kext)
        Name(_UID, 19)
        Name(_STA, 0x0B)
    }
}
//EOF
