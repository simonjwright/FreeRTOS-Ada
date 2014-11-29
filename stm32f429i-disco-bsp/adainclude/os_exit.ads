procedure OS_Exit (Code : Integer);
pragma Export (C, OS_Exit, "exit");
pragma No_Return (OS_Exit);
