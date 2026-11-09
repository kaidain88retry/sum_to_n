! sum_to_n.f90
! 計算 1 + 2 + ... + N，並以公式 N(N+1)/2 驗證結果
program sum_to_n
    implicit none
    integer(kind=8) :: n, i, total, formula
    integer :: ios

    write(*, '(A)', advance='no') '請輸入正整數 N: '
    read(*, *, iostat=ios) n

    if (ios /= 0) then
        write(*, '(A)') '輸入錯誤：請輸入一個整數。'
        stop 1
    end if

    if (n < 1) then
        write(*, '(A)') '輸入錯誤：N 必須是正整數。'
        stop 1
    end if

    ! 用迴圈累加
    total = 0
    do i = 1, n
        total = total + i
    end do

    ! 用公式驗證
    formula = n * (n + 1) / 2

    write(*, '(A, I0, A, I0)') '1 加到 ', n, ' 的總和 = ', total
    if (total == formula) then
        write(*, '(A)') '驗證：與公式 N(N+1)/2 結果相符'
    else
        write(*, '(A, I0)') '警告：與公式結果不符，公式值 = ', formula
    end if
end program sum_to_n
