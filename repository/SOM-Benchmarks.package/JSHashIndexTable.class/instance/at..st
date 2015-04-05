accessing
at: name
    | slot |
    slot := self hashSlotFor: name.

    " subtract 1, 0 stands for empty "
    ^ ((hashTable at: slot) & 255) - 1