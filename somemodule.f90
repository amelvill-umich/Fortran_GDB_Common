module somemodule

    integer*8    moduleVar

    !Comment out the line below to make "call moduleVar" start working again
    common /othermodule/  moduleVar

end module