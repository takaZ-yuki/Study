main = do
    {-
        変数
    -}
    let u = 2
    print u

    {-
        四則演算
    -}
    let plus = 3 + 2   -- 足し算
    print "3 + 2 = "
    print plus

    let minus = 3 - 2   -- 引き算
    print "3 - 2 = "
    print minus

    let multiplication = 3 * 2   -- 掛け算
    print "3 * 2 = "
    print multiplication
    
    let division = 3 / 2   -- 割り算
    print "3 / 2 = "
    print division

    let x = 3 `mod` 2   -- 余りあり割り算
    print "3 'mod' 2 = "
    print x
    
    let y = 3 ^ 2   -- Intの累乗
    print "3 ^ 2 = "
    print y

    let z = 3 ** 2  -- Doubleの累乗
    print "3 ** 2 = "
    print z

    {-
        四則演算（省略.ver）
    -}
    let k = (+) 3 2
    print "(+) 3 2"
    print k

    let w = (-) 3 2
    print "(-) 3 2"
    print w

    let a = (*) 3 2
    print "(*) 3 2"
    print a

    let b = (/) 3 2
    print "(/) 3 2"
    print b

    let c = mod 3 2
    print "mod 3 2"
    print c

    return x