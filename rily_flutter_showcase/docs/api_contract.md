# API Contract

This project currently uses `MockApiClient`, but the screens are organized to support a real REST backend.

## Auth

### POST /auth/login

Request:

```json
{
  "email": "achraf.demo@rily.app",
  "password": "demo1234"
}
```

Response:

```json
{
  "id": "u_001",
  "name": "Achraf Karzit",
  "email": "achraf.demo@rily.app",
  "token": "jwt-token"
}
```

## Beauty

### GET /beauty/salons

Response:

```json
[
  {
    "id": "salon_001",
    "name": "RiLy Beauty Studio",
    "city": "Casablanca",
    "rating": 4.8,
    "services": ["Haircut", "Nails", "Makeup"]
  }
]
```

## Parking

### GET /parking/locations

Response:

```json
[
  {
    "id": "parking_001",
    "name": "RiLyPark Maarif",
    "city": "Casablanca",
    "availableSlots": 18,
    "pricePerHour": 8.0
  }
]
```

## Reservation

### POST /reservations

Request:

```json
{
  "type": "beauty",
  "targetId": "salon_001",
  "date": "2026-07-05T14:00:00Z"
}
```

Response:

```json
{
  "id": "res_001",
  "title": "RiLy Beauty Studio",
  "status": "confirmed"
}
```
