import { ScrollView, Text, View } from "react-native";

const cards = ["Cần duyệt", "Khẩn", "Quá hạn", "Sắp đến hạn"];

export default function HomeScreen() {
  return (
    <ScrollView contentContainerStyle={{ padding: 20, gap: 16 }}>
      <Text style={{ fontSize: 28, fontWeight: "700" }}>VWork</Text>
      <Text>Hôm nay cần xử lý gì?</Text>
      {cards.map((label) => (
        <View key={label} style={{ padding: 16, borderWidth: 1, borderRadius: 8 }}>
          <Text style={{ fontWeight: "600" }}>{label}</Text>
          <Text style={{ fontSize: 24 }}>0</Text>
        </View>
      ))}
    </ScrollView>
  );
}
