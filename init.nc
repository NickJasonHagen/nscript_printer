class printer{
    func list(){
        if @OS == "Unix"{
            ret = runwait("lpstat -p -d")
        }
        else{
            ret = runwait("wmic printer list brief")
        }
        ret
    }
    func print(printer,filetoprint){
        if @OS == "Unix"{
            ret = runwait(cat("lpr -P ",printer," ",filetoprint))
        }
        else{
            ret = runwait("Get-Printer | Out-File -FilePath ",filetoprint)
        }        
    }
}
