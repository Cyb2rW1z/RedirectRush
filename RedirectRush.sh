while read -r url; do
    response=$(curl -sIL -L "$url" | grep -i "location:.*evil\.com" | grep -i "host:.*evil\.com")
    if [ -n "$response" ]; then
        echo "Potential open redirect found in: $url"
        # You can customize this part to log or notify as needed
    fi
done < real
