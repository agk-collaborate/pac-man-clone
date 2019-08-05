
function ReplaceColor(_imgID, _r1, _g1, _b1, _a1, _r2, _g2, _b2, _a2)
    _mem = CreateMemblockFromImage(_imgID)
    
    _width = GetMemblockInt(_mem, 0)
    _height = GetMemblockInt(_mem, 4)
    _bitDepth = GetMemblockInt(_mem, 8)
    
    _currByte = 8
    for i = 1 to _width
        for j = 1 to _height
            inc _currByte, 4
            
            if not GetMemblockByte(_mem, _currByte) = _r1 then continue
            if not GetMemblockByte(_mem, _currByte + 1) = _g1 then continue
            if not GetMemblockByte(_mem, _currByte + 2) = _b1 then continue
            if not GetMemblockByte(_mem, _currByte + 3) = _a1 then continue
            
            SetMemblockByte( _mem, _currByte, _r2 )        // R
            SetMemblockByte( _mem, _currByte + 1, _g2 )    // G
            SetMemblockByte( _mem, _currByte + 2, _b2 )    // B
            SetMemblockByte( _mem, _currByte + 3, _a2 )    // A
        next j
    next i
    
    _ret_imgID = CreateImageFromMemblock(_mem)
    
    DeleteMemblock(_mem)
endfunction _ret_imgID
