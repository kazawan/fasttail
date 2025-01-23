#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

#ECHO  ________   ______    ______  ________        ________   ______   ______  __       
# 88888888888  db         ad88888ba  888888888888     888888888888    db         88  88           
# 88          d88b       d8"     "8b      88               88        d88b        88  88           
# 88         d8'`8b      Y8,              88               88       d8'`8b       88  88           
# 88aaaaa   d8'  `8b     `Y8aaaaa,        88               88      d8'  `8b      88  88           
# 88"""""  d8YaaaaY8b      `"""""8b,      88               88     d8YaaaaY8b     88  88           
# 88      d8""""""""8b           `8b      88               88    d8""""""""8b    88  88           
# 88     d8'        `8b  Y8a     a8P      88               88   d8'        `8b   88  88           
# 88    d8'          `8b  "Y88888P"       88               88  d8'          `8b  88  88888888888  

clear


echo -e "${GREEN}88888888888  db         ad88888ba  888888888888     888888888888    db         88  88           ${NC}"
echo -e "${GREEN}88          d88b       d8       8b      88               88        d88b        88  88           ${NC}"
echo -e "${GREEN}88         d8  8b      Y8,              88               88       d8  8b       88  88           ${NC}"
echo -e "${GREEN}88aaaaa   d8'   8b      Y8aaaaa,        88               88      d8'   8b      88  88           ${NC}"
echo -e "${GREEN}88       d8YaaaaY8b           8b,       88               88     d8YaaaaY8b     88  88           ${NC}"
echo -e "${GREEN}88      d8        8b            8b      88               88    d8        8b    88  88           ${NC}"
echo -e "${GREEN}88     d8'         8b  Y8a     a8P      88               88   d8'         8b   88  88           ${NC}"
echo -e "${GREEN}88    d8'           8b  "Y88888P"       88               88  d8'           8b  88  88888888888  ${NC}"

echo -e "============================================================================================================= "
echo -e "\r\n"







echo -ne "${GREEN}|快速安装tailwindcss....${NC}\r"

# 更新安装命令以使用新的vite插件
npm install  tailwindcss @tailwindcss/vite

echo -ne "                                               \r"
echo -ne "${GREEN}|安装完成！${NC}\r"   

# 初始化tailwindcss (不再需要-p参数，因为我们使用vite插件)
echo -ne "                                               \r"
echo -ne "${GREEN}|初始化tailwindcss....${NC}\r"

# npx tailwindcss init

echo -ne "                                               \r"    
echo -ne "${GREEN}|初始化完成！${NC}\r"
sleep 0.25 

# 修改vite.config.js文件
FILE_VITE_CONFIG="./vite.config.js"

if [ ! -f "$FILE_VITE_CONFIG" ]; then
    # 创建新的vite.config.js
    cat > $FILE_VITE_CONFIG << EOL
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
})
EOL
    echo -ne "${GREEN}创建并配置 vite.config.js 完成！${NC}\r"
    sleep 0.25
else
    # 如果文件已存在，备份后重新创建
    cp $FILE_VITE_CONFIG "${FILE_VITE_CONFIG}.backup"
    cat > $FILE_VITE_CONFIG << EOL
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
})
EOL
    echo -ne "${GREEN}更新 vite.config.js 配置完成！${NC}\r"
    sleep 0.25
fi

FILE_INDEX_CSS="./src/index.css"    

if [ ! -f "$FILE_INDEX_CSS" ]; then
    echo -ne "${RED}/  ./src/index.css 文件不存在！${NC}\r"
    sleep 0.25
else
    echo -ne "${GREEN}- 文件存在！${NC}\r"
    sleep 0.25
    # 使用新的导入语法
    echo "" > $FILE_INDEX_CSS
    echo '@import "tailwindcss";' >> $FILE_INDEX_CSS
    
    # 添加基础样式
    echo ":root {" >> $FILE_INDEX_CSS
    echo "  font-family: Inter, system-ui, Avenir, Helvetica, Arial, sans-serif;" >> $FILE_INDEX_CSS
    echo "  line-height: 1.5;" >> $FILE_INDEX_CSS
    echo "  font-weight: 400;" >> $FILE_INDEX_CSS
    echo "" >> $FILE_INDEX_CSS
    echo "  color-scheme: light dark;" >> $FILE_INDEX_CSS
    echo "  color: rgba(255, 255, 255, 0.87);" >> $FILE_INDEX_CSS
    echo "  background-color: #242424;" >> $FILE_INDEX_CSS
    echo "" >> $FILE_INDEX_CSS
    echo "  font-synthesis: none;" >> $FILE_INDEX_CSS
    echo "  text-rendering: optimizeLegibility;" >> $FILE_INDEX_CSS
    echo "  -webkit-font-smoothing: antialiased;" >> $FILE_INDEX_CSS
    echo "  -moz-osx-font-smoothing: grayscale;" >> $FILE_INDEX_CSS
    echo "}" >> $FILE_INDEX_CSS
    
    echo -ne "${GREEN}\ index.css文件修改完成！${NC}\r"
    sleep 0.25
fi

# 修改tailwind.config.js
FILE_TAILWIND_CONFIG_JS="./tailwind.config.js"    

if [ ! -f "$FILE_TAILWIND_CONFIG_JS" ]; then
    echo -ne "${RED} tailwind.config.js 文件不存在！${NC}\r"
    sleep 0.25
else
    echo "" > $FILE_TAILWIND_CONFIG_JS
    echo "/** @type {import('tailwindcss').Config} */" >> $FILE_TAILWIND_CONFIG_JS
    echo "export default {" >> $FILE_TAILWIND_CONFIG_JS
    echo "  content: [" >> $FILE_TAILWIND_CONFIG_JS
    echo "    './index.html'," >> $FILE_TAILWIND_CONFIG_JS
    echo "    './src/**/*.{vue,js,ts,jsx,tsx}'," >> $FILE_TAILWIND_CONFIG_JS
    echo "  ]," >> $FILE_TAILWIND_CONFIG_JS
    echo "  theme: {" >> $FILE_TAILWIND_CONFIG_JS
    echo "    extend: {}," >> $FILE_TAILWIND_CONFIG_JS
    echo "  }," >> $FILE_TAILWIND_CONFIG_JS
    echo "  plugins: []," >> $FILE_TAILWIND_CONFIG_JS
    echo "};" >> $FILE_TAILWIND_CONFIG_JS
    
    echo -ne "${GREEN} tailwind.config.js文件修改完成！${NC}\r"
    sleep 0.25
fi

# 删除./src/App.css文件 
FILE_APP_CSS="./src/App.css"    # App.css文件路径
# 判断文件是否存在
if [ ! -f "$FILE_APP_CSS" ]; then
    echo -ne "                                               \r"

    echo -ne "${RED}./src/App.css 文件不存在！${NC}\r"
    sleep 0.25
    touch $FILE_APP_CSS
    echo -ne "                                               \r"

    echo -ne "${GREEN}创建App.css文件完成！${NC}\r"
    sleep 0.25
    #root {
    # max-width: 1280px;
    # margin: 0 auto;
    # padding: 2rem;
    # text-align: center;
    # }
    echo ":root {" >> $FILE_APP_CSS
    echo "  max-width: 1280px;" >> $FILE_APP_CSS
    echo "  margin: 0 auto;" >> $FILE_APP_CSS
    echo "  padding: 2rem;" >> $FILE_APP_CSS
    echo "  text-align: center;" >> $FILE_APP_CSS
    echo "}" >> $FILE_APP_CSS
    echo -ne "                                               \r"

    echo -ne "${GREEN} App.css文件修改完成！${NC}\r"
    sleep 0.25


    
else
    echo -ne "                                               \r"

    echo -ne "${GREEN}./src/App.css文件存在！${NC}\r"   
    # 删除文件
    rm -rf $FILE_APP_CSS
    echo -ne "                                               \r"

    echo -ne "${RED} 删除App.css文件完成！${NC}\r"
    sleep 0.25
    touch $FILE_APP_CSS
    echo -ne "                                               \r"

    echo -ne "${GREEN}创建App.css文件完成！${NC}\r"
    sleep 0.25
    #root {
    # max-width: 1280px;
    # margin: 0 auto;
    # padding: 2rem;
    # text-align: center;
    # }
    echo ":root {" >> $FILE_APP_CSS
    echo "  max-width: 1280px;" >> $FILE_APP_CSS
    echo "  margin: 0 auto;" >> $FILE_APP_CSS
    echo "  padding: 2rem;" >> $FILE_APP_CSS
    echo "  text-align: center;" >> $FILE_APP_CSS
    echo "}" >> $FILE_APP_CSS
    echo -ne "                                               \r"

    echo -ne "${GREEN} App.css文件修改完成！${NC}\r"
fi

# 修改App.jsx文件
FILE_APP_JSX="./src/App.jsx"    # App.js文件路径
# 判断文件是否存在
if [ ! -f "$FILE_APP_JSX" ]; then
    echo -ne "                                               \r"

    echo -ne "${RED}./src/App.jsx 文件不存在！${NC}\r"
    sleep 0.25
    
else
    echo -ne "                                               \r"

    echo -ne "${GREEN}./src/App.jsx文件存在！${NC}\r"
    sleep 0.25
    # 删除文件
    rm -rf $FILE_APP_JSX
    echo -ne "                                               \r"

    echo -ne "${RED} 删除App.jsx文件完成${NC}\r"
    sleep 0.25
    touch $FILE_APP_JSX
    echo -ne "                                               \r"

    echo -ne "${GREEN}创建App.jsx文件完成！${NC}\r"
    sleep 0.25
    # 在文件头部添加内容
    echo "function App() {" >> $FILE_APP_JSX
    echo "  return (" >> $FILE_APP_JSX
    echo "    <div className=' text-xl h-12 text-center font-bold  ' style={{background: 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)'}} > " >> $FILE_APP_JSX
    echo "    FAST TAIL" >> $FILE_APP_JSX
    echo "     <span className=' text-green-400'> DONE</span>" >> $FILE_APP_JSX
    echo "    </div>" >> $FILE_APP_JSX
    echo "  );" >> $FILE_APP_JSX
    echo "}" >> $FILE_APP_JSX
    echo "export default App;" >> $FILE_APP_JSX



    echo -ne "                                               \r"

    echo -ne "${GREEN}App.jsx文件修改完成！${NC}\r"
    sleep 0.25


fi
echo -ne "                                               \r"

echo -ne "${GREEN}快速安装tailwindcss完成！${NC}\r"
sleep 0.25






