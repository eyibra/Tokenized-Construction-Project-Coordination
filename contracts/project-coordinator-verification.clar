;; Project Coordinator Verification Contract
;; Validates and manages construction project coordinators

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_LICENSE (err u103))

;; Data structures
(define-map coordinators
  { coordinator: principal }
  {
    verified: bool,
    license-number: (string-ascii 50),
    verification-date: uint,
    experience-years: uint,
    specialization: (string-ascii 100)
  }
)

(define-map coordinator-projects
  { coordinator: principal }
  { active-projects: uint, completed-projects: uint }
)

;; Public functions
(define-public (verify-coordinator
  (coordinator principal)
  (license-number (string-ascii 50))
  (experience-years uint)
  (specialization (string-ascii 100)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (> (len license-number) u0) ERR_INVALID_LICENSE)
    (asserts! (is-none (map-get? coordinators { coordinator: coordinator })) ERR_ALREADY_VERIFIED)

    (map-set coordinators
      { coordinator: coordinator }
      {
        verified: true,
        license-number: license-number,
        verification-date: block-height,
        experience-years: experience-years,
        specialization: specialization
      }
    )

    (map-set coordinator-projects
      { coordinator: coordinator }
      { active-projects: u0, completed-projects: u0 }
    )

    (ok true)
  )
)

(define-public (update-project-count (coordinator principal) (active uint) (completed uint))
  (begin
    (asserts! (is-some (map-get? coordinators { coordinator: coordinator })) ERR_NOT_FOUND)

    (map-set coordinator-projects
      { coordinator: coordinator }
      { active-projects: active, completed-projects: completed }
    )

    (ok true)
  )
)

;; Read-only functions
(define-read-only (is-verified-coordinator (coordinator principal))
  (match (map-get? coordinators { coordinator: coordinator })
    coordinator-data (get verified coordinator-data)
    false
  )
)

(define-read-only (get-coordinator-info (coordinator principal))
  (map-get? coordinators { coordinator: coordinator })
)

(define-read-only (get-coordinator-projects (coordinator principal))
  (map-get? coordinator-projects { coordinator: coordinator })
)
