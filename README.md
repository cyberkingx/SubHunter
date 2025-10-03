# 🔍 Recon Tools Menu

Bu script, siber güvenlik uzmanları ve penetrasyon testerleri için çeşitli keşif (reconnaissance) araçlarını tek bir menü altında toplayan kapsamlı bir Bash scriptidir.

## 📋 İçindekiler

- [Özellikler](#özellikler)
- [Gereksinimler](#gereksinimler)
- [Kurulum](#kurulum)
- [Kullanım](#kullanım)
- [Araçlar](#araçlar)
- [Çıktı Dosyaları](#çıktı-dosyaları)
- [Sorun Giderme](#sorun-giderme)

## 🚀 Özellikler

- **15+ Güçlü Araç**: Subdomain keşfi, web crawling, URL toplama ve analiz
- **Otomatik Dosya Yönetimi**: Tarih/saat damgalı çıktı dosyaları
- **Renkli Arayüz**: Kolay kullanım için renklendirilmiş terminal çıktısı
- **Interaktif Menü**: Kullanıcı dostu seçim sistemi
- **Hata Yönetimi**: Dosya kontrolleri ve hata mesajları

## 📦 Gereksinimler

### Sistem Gereksinimleri
- **İşletim Sistemi**: Linux (Ubuntu, Debian, Kali Linux, Arch, vb.)
- **Shell**: Bash 4.0+
- **Temel Araçlar**: curl, grep, sort, jq

### Kurulması Gereken Araçlar

#### 1. Temel Sistem Araçları
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install curl grep coreutils jq

# Arch Linux
sudo pacman -S curl grep coreutils jq

# CentOS/RHEL/Fedora
sudo yum install curl grep coreutils jq
# veya dnf için:
sudo dnf install curl grep coreutils jq
```

#### 2. Subdomain Keşif Araçları

**Subfinder**
```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
```

**Amass**
```bash
go install -v github.com/owasp-amass/amass/v4/...@master
```

**AssetFinder**
```bash
go install github.com/tomnomnom/assetfinder@latest
```

**Sublist3r**
```bash
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt
sudo ln -s $(pwd)/sublist3r.py /usr/local/bin/sublist3r
```

**Findomain**
```bash
wget https://github.com/Findomain/Findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
sudo mv findomain-linux /usr/local/bin/findomain
```

#### 3. Web Crawling ve URL Araçları

**Katana**
```bash
go install github.com/projectdiscovery/katana/cmd/katana@latest
```

**GAU (GetAllUrls)**
```bash
go install github.com/lc/gau/v2/cmd/gau@latest
```

**WaybackUrls**
```bash
go install github.com/tomnomnom/waybackurls@latest
```

**HTTPx**
```bash
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
```

#### 4. Analiz Araçları

**DNSGen**
```bash
pip3 install dnsgen
```

**GF (Grep Framework)**
```bash
go install github.com/tomnomnom/gf@latest
# GF patterns kurulumu
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
cp Gf-Patterns/*.json ~/.gf
```

**URO**
```bash
pip3 install uro
```

#### 5. İsteğe Bağlı Araçlar

**Nuclei Fuzzer**
```bash
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
```

### Go Kurulumu (Gerekirse)
```bash
# Ubuntu/Debian
sudo apt install golang-go

# Arch Linux
sudo pacman -S go

# Manuel kurulum
wget https://golang.org/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### Python3 ve Pip Kurulumu
```bash
# Ubuntu/Debian
sudo apt install python3 python3-pip

# Arch Linux
sudo pacman -S python python-pip

# CentOS/RHEL/Fedora
sudo yum install python3 python3-pip
```

## 🛠️ Kurulum

1. **Script İndir**:
```bash
git clone <repository-url>
# veya dosyayı doğrudan indirin
wget <script-url>/recon_tools_menu.sh
```

2. **Çalıştırma İzni Ver**:
```bash
chmod +x recon_tools_menu.sh
```

3. **Çalıştır**:
```bash
./recon_tools_menu.sh
```

## 💻 Kullanım

### Temel Kullanım
```bash
./recon_tools_menu.sh
```

Script çalıştırıldığında interaktif bir menü görüntülenir:

```
╔═══════════════════════════════════════════════════════════════════════╗
║                        RECON TOOLS MENU                              ║
║                   Tüm Araçlar Tek Menüde                             ║
╚═══════════════════════════════════════════════════════════════════════╝

=== SUBDOMAIN DISCOVERY ===
1)  Subfinder      - Fast subdomain discovery
2)  Amass          - Asset discovery tool
3)  AssetFinder    - Find domains and subdomains
4)  Sublist3r      - Python subdomain enumeration
5)  Findomain      - Fast subdomain enumeration
6)  CRT.sh         - Certificate transparency logs

=== WEB CRAWLING & URL COLLECTION ===
7)  Katana         - Web crawler & spider
8)  NucleiFuzzer   - Template-based security scanning
9)  GAU            - Get All URLs
10) DNSGen         - DNS wordlist generator
11) WaybackUrls    - Wayback machine URLs
12) Wayback Machine- Web archive crawler

=== ANALYSIS & PROCESSING ===
13) HTTPx          - HTTP toolkit
14) GF             - Wrapper for grep
15) URO            - URL organizer

0)  Çıkış

Lütfen bir seçenek girin (0-15):
```

### Örnek Kullanım Senaryoları

#### 1. Subdomain Keşfi
```bash
# Script çalıştır
./recon_tools_menu.sh

# Menüden 1'i seç (Subfinder)
> 1

# Target domain gir
Target domain girin (örn: example.com):
> tesla.com

# Sonuç dosyası otomatik oluşturulur:
# tesla.com_subfinder_20231003_143022.txt
```

#### 2. URL Toplama Pipeline
```bash
# 1. Subfinder ile subdomain bul
# 2. HTTPx ile aktif olanları filtrele (seçenek 13)
# 3. GAU ile URL'leri topla (seçenek 9)
# 4. URO ile unique URL'leri filtrele (seçenek 15)
```

#### 3. Güvenlik Analizi
```bash
# 1. Wayback Machine ile historical URL'ler (seçenek 12)
# 2. GF ile potansiyel vulnerability patterns ara (seçenek 14)
```

## 🔧 Araçlar

### Subdomain Discovery

| Araç | Açıklama | Çıktı Format |
|------|----------|--------------|
| **Subfinder** | En hızlı subdomain discovery aracı | Liste format |
| **Amass** | OWASP destekli comprehensive discovery | Liste format |
| **AssetFinder** | Basit ve etkili subdomain finder | Liste format |
| **Sublist3r** | Python tabanlı passive enumeration | Liste format |
| **Findomain** | Rust tabanlı hızlı discovery | Liste format |
| **CRT.sh** | Certificate Transparency logs | HTML'den regex extraction |

### Web Crawling & URL Collection

| Araç | Açıklama | Özel Özellik |
|------|----------|--------------|
| **Katana** | Modern web crawler | JavaScript rendering |
| **GAU** | Archive.org, AlienVault OTX, Common Crawl | Multi-source |
| **WaybackUrls** | Wayback Machine URL collector | Historical data |
| **Wayback Machine** | Direct CDX API access | Raw historical URLs |

### Analysis & Processing

| Araç | Açıklama | Input Gereksinimi |
|------|----------|------------------|
| **HTTPx** | HTTP probe ve verification | URL/Domain listesi |
| **GF** | Pattern-based grepping | URL listesi |
| **URO** | URL filtering ve dedupe | URL listesi |
| **DNSGen** | DNS wordlist generation | Subdomain listesi |

## 📁 Çıktı Dosyaları

Tüm çıktılar otomatik olarak aşağıdaki format ile isimlendrilir:
```
{target}_{tool}_{YYYYMMDD_HHMMSS}.txt
```

**Örnek dosya isimleri:**
- `tesla.com_subfinder_20231003_143022.txt`
- `example.com_amass_20231003_144530.txt`
- `target.com_httpx_20231003_145612.txt`

### Çıktı Lokasyonu
Tüm dosyalar scriptin çalıştırıldığı dizine kaydedilir.

## 🔍 Gelişmiş Kullanım

### Pipeline Örnekleri

#### Comprehensive Subdomain Discovery
```bash
# 1. Birden fazla araçla subdomain topla
# 2. Sonuçları birleştir ve tekrarları temizle

cat tesla.com_subfinder_*.txt tesla.com_amass_*.txt tesla.com_assetfinder_*.txt | sort -u > tesla_all_subdomains.txt
```

#### Active Recon Pipeline
```bash
# 1. Subdomain keşfi
# 2. HTTP probe
# 3. URL collection
# 4. Pattern analysis

./recon_tools_menu.sh
# Sırasıyla: 1 (Subfinder) → 13 (HTTPx) → 9 (GAU) → 14 (GF)
```

### API Keys ve Konfigürasyon

Bazı araçlar daha iyi sonuç için API key gerektirebilir:

**Subfinder Config**
```bash
# ~/.config/subfinder/config.yaml
shodan: ["your-shodan-api-key"]
censys: ["your-censys-api-id:your-censys-secret"]
github: ["your-github-token"]
```

**Amass Config**
```bash
# ~/.config/amass/config.ini
[data_sources.Shodan]
apikey = your-shodan-api-key

[data_sources.Censys]
api_id = your-censys-api-id
secret = your-censys-secret
```

## 🐛 Sorun Giderme

### Yaygın Hatalar ve Çözümleri

#### "Command not found" Hatası
```bash
# Araç kurulu değil veya PATH'de değil
# Çözüm: İlgili aracı kurun ve PATH'e ekleyin

echo $PATH
which subfinder
```

#### "Permission denied" Hatası
```bash
# Script çalıştırma izni yok
chmod +x recon_tools_menu.sh
```

#### "jq: command not found" (CRT.sh için)
```bash
# jq kurulu değil (artık gerekmiyor ama sistem için iyi)
sudo apt install jq
```

#### Go araçları çalışmıyor
```bash
# Go PATH problemi
export PATH=$PATH:$HOME/go/bin
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
```

#### Python araçları çalışmıyor
```bash
# Python PATH veya pip problemi
pip3 install --user dnsgen uro
export PATH=$PATH:$HOME/.local/bin
```

### Log Dosyaları
Script hataları terminal çıktısında gösterilir. Debug için:
```bash
bash -x recon_tools_menu.sh
```

### Performance İpuçları

1. **Paralel Çalışma**: Birden fazla terminal açıp farklı araçları aynı anda çalıştırın
2. **Dosya Boyutları**: Büyük target'lar için disk alanına dikkat edin  
3. **Rate Limiting**: API tabanlı araçlar için rate limit'lere dikkat edin
4. **Memory Usage**: Büyük domain listleri için RAM kullanımını izleyin

## 📞 Destek

### İletişim
- Bug report ve feature request'ler için GitHub Issues kullanın
- Genel sorular için Discussions sekmesini kullanın

### Katkıda Bulunma
1. Fork yapın
2. Feature branch oluşturun
3. Değişikliklerinizi commit edin  
4. Pull request oluşturun

## ⚖️ Lisans

Bu araç educational purposes için tasarlanmıştır. Sadece kendi sahip olduğunuz veya izniniz olan sistemlerde kullanın.

---

**Güvenlik Uyarısı**: Bu araçları sadece yasal ve etik amaçlar için kullanın. Hedef sistemler üzerinde uygun yetkilere sahip olduğunuzdan emin olun.