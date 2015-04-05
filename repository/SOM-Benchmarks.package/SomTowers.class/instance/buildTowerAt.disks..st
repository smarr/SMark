towers
buildTowerAt: pile disks: disks
        disks to: 0 by: -1 do: [ :i |
            self pushDisk: (SomTowersDisk new: i) onPile: pile ]