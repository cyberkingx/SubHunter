#!/bin/bash

# Recon Tools Menu - Tüm araçları tek script altında toplayan menü sistemi
# Usage: ./recon_tools_menu.sh

# Renkli çıktı için
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
clear
echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                        RECON TOOLS MENU                              ║${NC}"
echo -e "${CYAN}║                   Tüm Araçlar Tek Menüde                             ║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Menü fonksiyonu
show_menu() {
    echo -e "${YELLOW}=== SUBDOMAIN DISCOVERY ===${NC}"
    echo -e "${GREEN}1)${NC}  Subfinder      - Fast subdomain discovery"
    echo -e "${GREEN}2)${NC}  Amass          - Asset discovery tool"
    echo -e "${GREEN}3)${NC}  AssetFinder    - Find domains and subdomains"
    echo -e "${GREEN}4)${NC}  Sublist3r      - Python subdomain enumeration"
    echo -e "${GREEN}5)${NC}  Findomain      - Fast subdomain enumeration"
    echo -e "${GREEN}6)${NC}  CRT.sh         - Certificate transparency logs"
    echo ""
    echo -e "${YELLOW}=== WEB CRAWLING & URL COLLECTION ===${NC}"
    echo -e "${GREEN}7)${NC}  Katana         - Web crawler & spider"
    echo -e "${GREEN}8)${NC}  NucleiFuzzer   - Template-based security scanning"
    echo -e "${GREEN}9)${NC}  GAU            - Get All URLs"
    echo -e "${GREEN}10)${NC} DNSGen         - DNS wordlist generator"
    echo -e "${GREEN}11)${NC} WaybackUrls    - Wayback machine URLs"
    echo -e "${GREEN}12)${NC} Wayback Machine- Web archive crawler"
    echo ""
    echo -e "${YELLOW}=== ANALYSIS & PROCESSING ===${NC}"
    echo -e "${GREEN}13)${NC} HTTPx          - HTTP toolkit"
    echo -e "${GREEN}14)${NC} GF             - Wrapper for grep"
    echo -e "${GREEN}15)${NC} URO            - URL organizer"
    echo ""
    echo -e "${RED}0)${NC}  Çıkış"
    echo ""
}

# Domain/target input fonksiyonu
get_target() {
    echo -e "${CYAN}Target domain girin (örn: example.com):${NC}"
    read -p "> " target
    if [ -z "$target" ]; then
        echo -e "${RED}Target boş bırakılamaz!${NC}"
        get_target
    fi
}

# Output dosyası ismi oluşturma
get_output_file() {
    local tool_name=$1
    echo "${target}_${tool_name}_$(date +%Y%m%d_%H%M%S).txt"
}

# Araç çalıştırma fonksiyonları
run_subfinder() {
    get_target
    output_file=$(get_output_file "subfinder")
    echo -e "${BLUE}Subfinder çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: subfinder -d $target -all -o $output_file${NC}"
    subfinder -d "$target" -all -o "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_amass() {
    get_target
    output_file=$(get_output_file "amass")
    echo -e "${BLUE}Amass çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: amass enum -d $target -o $output_file${NC}"
    amass enum -d "$target" -o "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_assetfinder() {
    get_target
    output_file=$(get_output_file "assetfinder")
    echo -e "${BLUE}AssetFinder çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: assetfinder $target > $output_file${NC}"
    assetfinder "$target" > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_sublist3r() {
    get_target
    output_file=$(get_output_file "sublist3r")
    echo -e "${BLUE}Sublist3r çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: sublist3r -d $target -o $output_file${NC}"
    sublist3r -d "$target" -o "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_findomain() {
    get_target
    output_file=$(get_output_file "findomain")
    echo -e "${BLUE}Findomain çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: findomain -t $target -u $output_file${NC}"
    findomain -t "$target" -u "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_crtsh() {
    get_target
    output_file=$(get_output_file "crtsh")
    echo -e "${BLUE}CRT.sh çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: curl -s 'https://crt.sh/?q=$target' | grep -oE '[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' | sort -u > $output_file${NC}"
    curl -s "https://crt.sh/?q=$target" | grep -oE '[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' | sort -u > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_katana() {
    get_target
    output_file=$(get_output_file "katana")
    echo -e "${BLUE}Katana çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: katana -u $target -o $output_file${NC}"
    katana -u "$target" -o "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_nucleifuzzer() {
    get_target
    output_file=$(get_output_file "nucleifuzzer")
    echo -e "${BLUE}NucleiFuzzer çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: nf -d $target -o $output_file${NC}"
    nf -d "$target" -o "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_gau() {
    get_target
    output_file=$(get_output_file "gau")
    echo -e "${BLUE}GAU çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: gau $target > $output_file${NC}"
    gau "$target" > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_dnsgen() {
    echo -e "${CYAN}DNSGen için subdomain listesi dosyası girin:${NC}"
    read -p "Dosya yolu: " input_file
    if [ ! -f "$input_file" ]; then
        echo -e "${RED}Dosya bulunamadı: $input_file${NC}"
        return
    fi
    output_file=$(get_output_file "dnsgen")
    echo -e "${BLUE}DNSGen çalıştırılıyor${NC}"
    echo -e "${YELLOW}Komut: cat $input_file | dnsgen - > $output_file${NC}"
    cat "$input_file" | dnsgen - > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_waybackurls() {
    get_target
    output_file=$(get_output_file "waybackurls")
    echo -e "${BLUE}WaybackUrls çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: waybackurls $target > $output_file${NC}"
    waybackurls "$target" > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_wayback_machine() {
    get_target
    output_file=$(get_output_file "wayback")
    echo -e "${BLUE}Wayback Machine çalıştırılıyor: $target${NC}"
    echo -e "${YELLOW}Komut: curl -s 'http://web.archive.org/cdx/search/cdx?url=*.$target/*&collapse=urlkey&output=text&fl=original' > $output_file${NC}"
    curl -s "http://web.archive.org/cdx/search/cdx?url=*.$target/*&collapse=urlkey&output=text&fl=original" > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_httpx() {
    echo -e "${CYAN}HTTPx için URL listesi dosyası girin (veya tek URL için 'u' yazın):${NC}"
    read -p "Dosya yolu veya 'u': " input
    output_file=$(get_output_file "httpx")
    
    if [ "$input" = "u" ]; then
        get_target
        echo -e "${BLUE}HTTPx çalıştırılıyor: $target${NC}"
        echo -e "${YELLOW}Komut: echo $target | httpx -o $output_file${NC}"
        echo "$target" | httpx -o "$output_file"
    else
        if [ ! -f "$input" ]; then
            echo -e "${RED}Dosya bulunamadı: $input${NC}"
            return
        fi
        echo -e "${BLUE}HTTPx çalıştırılıyor${NC}"
        echo -e "${YELLOW}Komut: httpx -l $input -o $output_file${NC}"
        httpx -l "$input" -o "$output_file"
    fi
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_gf() {
    echo -e "${CYAN}GF için subdomain listesi dosyası girin (örn: target.txt):${NC}"
    read -p "Dosya yolu: " input_file
    if [ ! -f "$input_file" ]; then
        echo -e "${RED}Dosya bulunamadı: $input_file${NC}"
        return
    fi
    echo -e "${CYAN}GF parametresi girin (xss, redirect, ssti, sqli, urls, lfi, rce, ssrf):${NC}"
    read -p "Parametre: " pattern
    output_file=$(get_output_file "gf_${pattern}")
    echo -e "${BLUE}GF çalıştırılıyor${NC}"
    echo -e "${YELLOW}Komut: cat $input_file | gf $pattern > $output_file${NC}"
    cat "$input_file" | gf "$pattern" > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

run_uro() {
    echo -e "${CYAN}URO için URL listesi dosyası girin:${NC}"
    read -p "Dosya yolu: " input_file
    if [ ! -f "$input_file" ]; then
        echo -e "${RED}Dosya bulunamadı: $input_file${NC}"
        return
    fi
    output_file=$(get_output_file "uro")
    echo -e "${BLUE}URO çalıştırılıyor${NC}"
    echo -e "${YELLOW}Komut: cat $input_file | uro > $output_file${NC}"
    cat "$input_file" | uro > "$output_file"
    echo -e "${GREEN}Sonuçlar kaydedildi: $output_file${NC}"
}

# Ana döngü
while true; do
    show_menu
    echo -e "${CYAN}Lütfen bir seçenek girin (0-15):${NC}"
    read -p "> " choice
    echo ""
    
    case $choice in
        1) run_subfinder ;;
        2) run_amass ;;
        3) run_assetfinder ;;
        4) run_sublist3r ;;
        5) run_findomain ;;
        6) run_crtsh ;;
        7) run_katana ;;
        8) run_nucleifuzzer ;;
        9) run_gau ;;
        10) run_dnsgen ;;
        11) run_waybackurls ;;
        12) run_wayback_machine ;;
        13) run_httpx ;;
        14) run_gf ;;
        15) run_uro ;;
        0) 
            echo -e "${GREEN}Çıkılıyor...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Geçersiz seçenek! Lütfen 0-15 arası bir sayı girin.${NC}"
            ;;
    esac
    
    echo ""
    echo -e "${PURPLE}Devam etmek için Enter'a basın...${NC}"
    read
    clear
done