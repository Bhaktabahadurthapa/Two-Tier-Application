#!/bin/bash

# Start backend
echo "Starting backend..."
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python run.py &
BACKEND_PID=$!

# Start frontend
echo "Starting frontend..."
cd ../frontend
npm install
npm start &
FRONTEND_PID=$!

# Handle shutdown
function cleanup {
    echo "Shutting down services..."
    kill $BACKEND_PID
    kill $FRONTEND_PID
}

trap cleanup EXIT

# Wait for user input
echo "Press CTRL+C to stop all services"
wait
