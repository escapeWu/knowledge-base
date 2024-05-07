---
{"dg-publish":true,"permalink":"/backend/utils/java-execute-bash/","created":"2024-05-07T16:40:12.570+08:00","updated":"2024-05-07T16:49:39.754+08:00"}
---


## Usage：
==bash -c==: 
 使用 `ProcessBuilder` 时，它不会像在 shell 中那样自动展开通配符（如 `*`），因此需要指定使用  bash shell 来执行 cp 指令
```java
executeCommand("bash -c \"cp *.24* ./target\"", true);
```

## 源码：
### 入口
```java
/**  
 * 使用processBuilder 执行指令  
 * @param commands 字符串指令  
 * @param workDir processBuilder 执行指令的时候所在的目录  
 * @param needWait 是否需要等待指令执行完成  
 */
private static void executeCommand(String commands, String workDir, Boolean needWait) {
        ProcessBuilder processBuilder = new ProcessBuilder(partitionCommandLine(commands));
        processBuilder.directory(new File(workDir));
        processBuilder.redirectErrorStream(true);
        processBuilder.inheritIO();

        try {
            Process start = processBuilder.start();

            if (needWait) {
                start.waitFor();
            }
        } catch (Exception e) {
            log.error("COMMAND EXECUTE FAILED: " + commands);
        } finally {
            log.info("--------------------- SUCCESS ----------------------");
        }

    }
```

> 命令错误_JAVA执行Linux命令报错Cannot run program error=2 , No such file or directory

### 转译字符串，processBuilder 识别
```java
public static String[] partitionCommandLine(final String command) {  
    // Create an ArrayList to store the individual command line arguments  
    final ArrayList<String> commands = new ArrayList<>();  
  
    // Initialize index for iterating through the characters in the command string  
    int index = 0;  
  
    // Initialize a StringBuffer to store characters of each argument  
    StringBuffer buffer = new StringBuffer(command.length());  
  
    // Initialize flags to track whether the current character is inside single or double quotes  
    boolean isApos = false; // for single quotes (')  
    boolean isQuote = false; // for double quotes (")  
  
    // Iterate through each character in the command string    while (index < command.length()) {  
        // Get the current character  
        final char c = command.charAt(index);  
  
        // Check the character  
        switch (c) {  
            // If the character is a space  
            case ' ':  
                // If not inside single or double quotes  
                if (!isQuote && !isApos) {  
                    // Extract the argument from the buffer  
                    final String arg = buffer.toString();  
                    // Reset the buffer to store the next argument  
                    buffer = new StringBuffer(command.length() - index);  
                    // If the argument is not empty, add it to the list of commands  
                    if (arg.length() > 0) {  
                        commands.add(arg);  
                    }  
                } else {  
                    // If inside single or double quotes, append the space to the buffer  
                    buffer.append(c);  
                }  
                break;  
            // If the character is a single quote  
            case '\'':  
                // Toggle the isApos flag to indicate whether currently inside single quotes or not  
                if (!isQuote) {  
                    isApos = !isApos;  
                } else {  
                    // If inside double quotes, append the single quote to the buffer  
                    buffer.append(c);  
                }  
                break;  
            // If the character is a double quote  
            case '"':  
                // Toggle the isQuote flag to indicate whether currently inside double quotes or not  
                if (!isApos) {  
                    isQuote = !isQuote;  
                } else {  
                    // If inside single quotes, append the double quote to the buffer  
                    buffer.append(c);  
                }  
                break;  
            // For any other character  
            default:  
                // Append the character to the buffer  
                buffer.append(c);  
                break;  
        }  
        // Move to the next character in the command string  
        index++;  
    }  
  
    // After processing all characters, check if there's any remaining content in the buffer  
    if (buffer.length() > 0) {  
        // Extract the last argument from the buffer and add it to the list of commands  
        final String arg = buffer.toString();  
        commands.add(arg);  
    }  
  
    // Convert the ArrayList of commands to an array of strings and return  
    return commands.toArray(new String[commands.size()]);  
}
```