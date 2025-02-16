import { WebSocketServer, WebSocket } from "ws";
import { SerialPort } from "serialport";

// Create a WebSocket server on port 8080
const wss = new WebSocketServer({ port: 8080 });

// Configure the serial port (adjust the path for your OS)
const port = new SerialPort({ path: "/dev/ttyUSB0", baudRate: 115200 });

wss.on("connection", (ws: WebSocket) => {
  console.log("New WebSocket connection established");

  ws.on("message", (message: string) => {
    console.log("Received from client:", message);

    // Example: Send a custom command to the Arduino board
    const command = Buffer.from([0xAA, 0x01, 0x00, 0xAB]);
    port.write(command);
  });

  // When data is received from Arduino, send it to WebSocket clients
  port.on("data", (data: Buffer) => {
    ws.send(data.toString("hex"));
  });
});

console.log("WebSocket server is running at ws://localhost:8080");
