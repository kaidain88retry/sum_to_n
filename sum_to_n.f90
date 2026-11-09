! sum_to_n.f90
! 計算 1 + 2 + ... + N，並以公式 N(N+1)/2 驗證結果
program sum_to_n                                   ! 宣告主程式，名稱為 sum_to_n
    implicit none                                  ! 關閉隱含型別，所有變數都必須明確宣告
    integer(kind=8) :: n, i, total, formula        ! 64 位元整數：N、計數器、總和、公式值
    integer :: ios                                 ! 一般整數：存放讀取輸入時的狀態碼

    write(*, '(A)', advance='no') '請輸入正整數 N: '   ! 輸出提示文字，advance='no' 讓游標停在同一行
    read(*, *, iostat=ios) n                       ! 從鍵盤讀入 N，讀取結果狀態存入 ios

    if (ios /= 0) then                             ! ios 不為 0 表示讀取失敗（例如輸入了非數字）
        write(*, '(A)') '輸入錯誤：請輸入一個整數。'     ! 輸出錯誤訊息
        stop 1                                     ! 以錯誤碼 1 結束程式
    end if                                         ! 結束輸入格式檢查

    if (n < 1) then                                ! 檢查 N 是否小於 1（0 或負數）
        write(*, '(A)') '輸入錯誤：N 必須是正整數。'     ! 輸出錯誤訊息
        stop 1                                     ! 以錯誤碼 1 結束程式
    end if                                         ! 結束範圍檢查

    ! 用迴圈累加
    total = 0                                      ! 累加器歸零
    do i = 1, n                                    ! i 從 1 跑到 N
        total = total + i                          ! 每次把 i 加進總和
    end do                                         ! 迴圈結束

    ! 用公式驗證
    formula = n * (n + 1) / 2                      ! 以等差級數公式直接算出應得的總和

    write(*, '(A, I0, A, I0)') '1 加到 ', n, ' 的總和 = ', total   ! 輸出結果，I0 表示依數字實際長度輸出
    if (total == formula) then                     ! 比較迴圈結果與公式結果
        write(*, '(A)') '驗證：與公式 N(N+1)/2 結果相符'   ! 兩者相同，輸出驗證成功
    else                                           ! 兩者不同的情況
        write(*, '(A, I0)') '警告：與公式結果不符，公式值 = ', formula   ! 輸出警告與公式值
    end if                                         ! 結束驗證判斷
end program sum_to_n                               ! 主程式結束
