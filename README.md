# smartdata-pl6

# Introduction

Perl6 grammars might be a natural way of parsing smartctl data. This
repo contains some attempts towards finding an elegant solution to
this problem.

# Input 

Data returned by smartctl is of the form
```
smartctl 6.3 2014-07-26 r3976 [i386-pc-solaris2.11] (local build)
Copyright (C) 2002-14, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Vendor:               HGST
Product:              HUS724040ALS640
Revision:             A280
Compliance:           SPC-4
User Capacity:        4,000,787,030,016 bytes [4.00 TB]
Logical block size:   512 bytes
LB provisioning type: unreported, LBPME=0, LBPRZ=0
Rotation Rate:        7200 rpm
Form Factor:          3.5 inches
Logical Unit id:      0x5000cca05ca01e40
Serial number:        PCJV1V1X
Device type:          disk
Transport protocol:   SAS (SPL-3)
Local Time is:        Sat Mar 11 23:52:22 2017 EST
SMART support is:     Available - device has SMART capability.
SMART support is:     Enabled
Temperature Warning:  Enabled

=== START OF READ SMART DATA SECTION ===
SMART Health Status: OK

Current Drive Temperature:     29 C
Drive Trip Temperature:        85 C

Manufactured in week 52 of year 2014
Specified cycle count over device lifetime:  50000
Accumulated start-stop cycles:  364
Specified load-unload count over device lifetime:  600000
Accumulated load-unload cycles:  970
Elements in grown defect list: 0

Vendor (Seagate) cache information
  Blocks sent to initiator = 4693423458091008

Error counter log:
           Errors Corrected by           Total   Correction     Gigabytes    Total
               ECC          rereads/    errors   algorithm      processed    uncorrected
           fast | delayed   rewrites  corrected  invocations   [10^9 bytes]  errors
read:      17140        1         0     17141     673280      61549.688           0
write:         0        0         0         0      34231      47375.594           0
verify:     5366       15         0      5381       1256        780.751           0

Non-medium error count:        0

No self-tests have been logged
```




