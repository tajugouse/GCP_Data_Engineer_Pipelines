function transform(line) {
    if (!line.trim()) return null; // Skip empty lines
    
    var values = line.split(',');
    if (values.length !== 5) return null; // Ensure exactly 5 values are present
    
    var obj = {
        id: values[0],
        name: values[1],
        email: values[2],
        age: values[3],
        city: values[4]
    };
    
    return JSON.stringify(obj);
}
