package event

import (
	"time"

	"github.com/google/uuid"
)

type Event struct {
	traceID     uuid.UUID `validate:"uuid4"`
	gzyID       uuid.UUID `validate:"uuid4"`
	appID       uuid.UUID `validate:"uuid4"`
	metadata    string    `validate:"json"`
	requestUrl  string    `validate:"url"`
	referralUrl string    `validate:"url"`
	clientID    string    `validate:"omitempty"`
	clientData  string    `validate:"json"`
	userAgent   string    `validate:"omitempty"`
	cookies     string    `validate:"omitempty"`

	category string `validate:"required"`
	name     string `validate:"required"`
	label    string `validate:"required"`
	payload  string `validate:"json"`

	createdAt time.Time
}
